# 3.3 AI 在企業中的應用

## 從一次呼叫到完整流程

AI 的應用可以從很簡單開始，逐步長出複雜度：

### 單次 LLM 呼叫

把文件丟給 LLM，轉換成結構化資料。例如用 OCR 把 PDF 轉成純文字，再用 LLM 提取關鍵欄位輸出 JSON。

不需要循環、不需要 memory、不需要多步驟。一次呼叫就搞定。

### Agent 執行固定流程

收到一封 email，你在指令裡寫清楚：「先分析附件取得編號 → 用編號查系統 → 找到負責人 → 建立待辦事項」。Agent 照著這個流程走。

指令寫得越清楚，Agent 的行為就越像 workflow。這是最快的起步方式：用 context 定義流程，改指令就改行為。

### Agent 自主決策

同樣的場景，但你只說「處理這封 email」。Agent 自己決定要做什麼、按什麼順序、要不要查系統。彈性高，但行為不一定每次一致。

### 穩定後抽出 hard-coded workflow

流程跑了一陣子都沒問題了，你發現其中幾個步驟根本不需要 LLM 推理（例如「把 JSON 寫進資料庫」）。這時可以把這些步驟抽出來用程式碼或 workflow 工具（如 n8n）跑，省下不必要的 token 成本。

```
單次 LLM 呼叫 → Agent + 嚴格指令 → Agent 自主決策
                                         ↓
                              流程穩定後，非推理步驟抽到 hard-coded workflow 省成本
```

起步不用想太多，先讓 Agent 跑起來。成本優化是後面的事。

## 用 Context 操縱行為，而非修改程式碼

一個有趣的做法：當你的 AI 產品需要針對不同客戶或場景有不同行為時，不一定要寫不同的程式碼。

你可以透過 context 注入來改變 Agent 的行為：

- 在 System Prompt 裡定義通用的 SOP
- 針對不同客戶或場景，在 runtime 注入客製化指令
- 客戶 A 偏好某種處理方式，客戶 B 有自己的命名規則，這些都可以用 context 承載

也就是說，你的 AI 產品不用改程式碼，光靠調整「context 設定」就能適應不同情境。這就是 Context Engineering 在產品層面的應用。

## Domain Twin：複製人的經驗

Digital Twin 複製的是設備，用虛擬模型模擬機台行為、預測故障。

**Domain Twin** 是把同樣的概念用在人身上：把資深員工的經驗、判斷邏輯、排查問題的 know-how，透過 AI 數位化，變成可以傳承、可以跨組織複製的東西。

這不是科幻。上一節講的「透過 context 注入客製化指令」就是 Domain Twin 的初步實現。SOP 是流程知識，客製化指令是領域知識。兩者都透過 context 傳遞給 AI，而不是寫在程式碼裡。

## 從 Context Engineering 的角度看未來

AI 產品的進化方向，越來越不是「寫更多程式碼」，而是「設計更好的 context」：

- 怎麼把人類的判斷邏輯轉譯成 AI 能理解的指令
- 怎麼讓不同角色的知識被 AI 系統所用
- 怎麼在不改程式碼的前提下，透過 context 調整 AI 的行為

所以 Context Engineering 不只是工程師的事。每個人對自己領域的專業知識，都是 AI 系統最有價值的 context 來源。

---

## Quiz

**Q1.** 你要做一個功能：把 PDF 發票轉成結構化的 JSON 資料。應該用什麼架構？

- A) Agent（多步驟自動化）
- B) 單次 LLM 呼叫
- C) Workflow + Agent 混合
- D) 不需要 AI，用傳統程式就好

<details><summary>答案</summary>B。這是一個「輸入 → 轉換 → 輸出」的任務，一次呼叫就能解決。不需要循環、不需要 memory、不需要多步驟。用 Agent 是 overkill。</details>

**Q2.** 你的 AI 產品要服務不同客戶，每個客戶有不同的處理邏輯。最符合 Context Engineering 精神的做法是？

- A) 每個客戶寫一套獨立的程式碼
- B) 用 if-else 判斷客戶 ID 來切換邏輯
- C) 在 runtime 把客戶專屬的指令注入到 context 中
- D) 訓練一個客戶專屬的模型

<details><summary>答案</summary>C。透過 context 注入客製化指令，不用改程式碼就能適應不同客戶。這是 Context Engineering 在產品層面的應用。</details>
