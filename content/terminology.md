# 術語表

快速查找指南中出現的關鍵術語。按出現順序排列。

## LLM 基礎

| 術語 | 白話解釋 |
|------|---------|
| **LLM** (Large Language Model) | 大型語言模型。用大量文字資料訓練出來的 AI，核心能力是預測下一個字 |
| **Token** | LLM 處理文字的最小單位。可以是一個字、一個詞、或詞的一部分 |
| **Next-token prediction** | LLM 的核心機制：根據前面的文字，預測下一個最可能出現的 token |
| **Attention** | LLM 在預測時，動態決定前文中「哪些 token 比較重要」的機制。不是平均地看，而是根據當前需求分配權重 |
| **Emergence** | 大規模訓練後自然冒出來的能力（如推理、翻譯），不是被刻意寫進去的 |
| **Hallucination** | 幻覺。LLM 生成的內容看起來合理但事實上錯誤。根源是 LLM 在預測「最可能的字」，不是在判斷「正確的答案」 |
| **Context window** | LLM 一次能「看到」的文字量上限。超出範圍的資訊 LLM 就看不到 |
| **Noise** | Context 中與任務無關的資訊。會消耗 attention，但通常不致命 |
| **Ambiguity** | Context 中多個資訊長得像、功能重疊，讓 LLM 抓不準重點。這才是出錯的主因 |

## 模型訓練與客製化

| 術語 | 白話解釋 |
|------|---------|
| **Transformer** | 2017 年提出的模型架構，讓 Attention 機制可以大規模平行運算。現在幾乎所有 LLM 都基於這個架構 |
| **Reasoning Training** | 訓練模型在回答前花更多時間「思考」（thinking tokens），提高複雜問題的準確度 |
| **Synthetic Data** | 合成資料。用現有的強模型生成高品質的訓練資料，補上真實資料不夠的地方 |
| **RLHF** (Reinforcement Learning from Human Feedback) | 用人類的偏好回饋來訓練模型，讓模型學會「什麼是好的回答」 |
| **Fine-tuning** | 用特定資料對模型做進一步訓練，直接改變模型的參數。成本高、有風險（可能破壞安全對齊）。通常先試 RAG + Context Engineering |
| **RAG** (Retrieval-Augmented Generation) | 讓 LLM 在回答前先查外部知識庫，用查到的真實資料來生成答案。防 hallucination 的主要手段 |
| **Prompt Engineering** | 設計好的指令（prompt）來引導 LLM 產出你要的結果 |
| **Context Engineering** | 比 Prompt Engineering 更廣：設計整個 context（指令、參考資料、工具定義、對話歷史）來控制 AI 的行為 |

## Agent

| 術語 | 白話解釋 |
|------|---------|
| **Agent** | LLM + Tools + Loop。一個能理解目標、使用工具、根據結果調整策略的 AI 系統 |
| **Tool Use** | LLM 輸出結構化指令（通常是 JSON）來呼叫外部系統（API、資料庫、程式碼執行等） |
| **Memory** | Agent 的外部記憶機制。把重要資訊寫到檔案或資料庫，下次對話時載入 context。像便利貼，不是大腦 |
| **Plan-Act-Reflect Loop** | Agent 的核心循環：規劃 → 執行 → 觀察結果 → 反思調整 → 再執行。讓 Agent 可以自我修正 |
| **Workflow** | 人類預先定義好的固定流程（if-else 分支）。可預測、可控、便宜 |

## 安全

| 術語 | 白話解釋 |
|------|---------|
| **Prompt Injection** | 惡意使用者透過精心設計的輸入，讓 AI 執行非預期的操作（如繞過安全限制、洩漏資料） |
| **Jailbreak** | Prompt injection 的一種，專門用來繞過 AI 的安全護欄，讓 AI 產出原本被禁止的內容 |
| **Guardrails** | 在 input 進入主 Agent 前，用一個小模型先過濾惡意意圖的機制 |
| **Blast Radius** | 影響範圍。當 AI 出錯時，能造成多大的損害。設計原則：限制 AI 的權限到最小必要範圍 |
| **HITL** (Human-in-the-Loop) | 在關鍵決策點設計人類審核。AI 做繁重工作，人類做最終確認。是刻意的架構設計 |

## 應用

| 術語 | 白話解釋 |
|------|---------|
| **Parallelization** | 平行化。同時啟動多個 AI 任務，你在各任務之間切換做決策。生產力來自同時推進的數量，不是單一任務的速度 |
| **Domain Twin** | 把資深員工的經驗和判斷邏輯，透過 context 傳遞給 AI，讓 AI 能複製這些知識。是 Digital Twin 用在人身上的版本 |
| **Vibe Coding** | 透過自然語言描述需求，讓 AI 協助生成和修改程式碼的工作方式 |
