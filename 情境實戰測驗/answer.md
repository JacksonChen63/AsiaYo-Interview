#題目一

1. ** 制定 SOP **

- 預備方案應對系統不可用情況。
- 提前告知相關人員，並且協調值班，以便快速解決問題。

2. ** 流量預測與容量規劃 **

- 使用過往數據或類似推廣活動的流量增長比例，預測可能的峰值流量。
- 根據預測結果，提前擴充基礎設施資源（比如 nodegroup 的 min desired max size）\ rate limit 等等。

3. ** 壓力測試與容量驗證 **

- 進行壓力測試，比如 k6 模擬流量，驗證系統承載能力。

#題目二

1. ** 檢查監控數據 **

- 檢查 CPU 和 Memory 使用率，是不是資源耗盡。
- 檢查是不是有突發的流量比對使用資源的狀況。
- 檢查 disk 空間是不是不足或是 disk i/o 繁忙。
- 查看 nginx、api logs ，看是否有異常。

2. ** 檢查網路連線 **

- 透過工具，比如 ping\traceroute 來檢查機器的網路狀態。

3. ** 服務恢復與隔離 **

- 暫時先隔離這台機器，透過新的機器取代。

#題目三

1. ** 檢查 SSH 配置 **

- 檢查 ~/.ssh/config 。

2. ** 檢查機器資源狀態 **

- 檢查是不是 memory 滿了，需要重啟。
- 檢查 ebs 狀態，有可能空間滿了，或是 ebs 壞掉了。

#題目四

1. 可以部署 Fluent Bit 當作 DaemonSet 負責收集和傳輸日誌，資源消耗少。部署 Fluentd 負責較複雜的日誌處理解析、聚合、過濾到後端像是 Elasticsearch\S3\Kafka 。

- 配置成 daemonset 是可以簡化管理和擴展，不需要為每個應用單獨設置 Sidecar，也減少 Pod 中容器數量和資源消耗。
- 如果僅使用 Fluentd 收集和處理大量日誌數據，會因其較高的資源需求導致性能下降。當日誌數量增加時，Fluent Bit 可擴展到更多節點，而 Fluentd 只需維持固定的中心化節點，處理壓力不會隨節點數量增加。

2. 當數據量太大高達每天超過 50~100 GB，直接傳送到 Elasticsearch 可能會導致緩慢、延遲增加甚至節點崩潰。
   解決方案：
   使用 Fluentd 的 Kafka 插件先將數據傳送到 Kafka broker，接著 Kafka connect 再將數據寫入 Elasticsearch 。

   這樣有以下好處：

   - Kafka 能夠緩衝高頻日誌，防止 Elasticsearch 過載
   - Kafka 支持多消費者，可以將數據分發到多個後端，比如 Elasticsearch、S3
   - Kafka 的持久話和分布式特性提供可靠性，確保數據不丟失
   - 之後可以透過增加 Kafka 的 broker 來處理數據量不斷增長的問題

如果數據量較小，可以直接使用 Fluentd 搭配 Elasticsearch 。
Elasticsearch 接收到 Kafka 傳送的日誌數據後，會自動對數據建立索引，然後 Kibana 這邊去 create index pattern 選 Elasticsearch 建立的索引。
