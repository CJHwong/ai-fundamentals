# 綜合測驗

這份測驗涵蓋所有章節。情境題為主，測的是判斷力，不是記憶力。

---

**Q1.** 你的同事說：「AI 就是一個很聰明的搜尋引擎。」這個說法哪裡有問題？

- A) AI 確實是搜尋引擎，沒有問題
- B) 搜尋引擎查的是既有資料，LLM 是根據 pattern 生成新的內容
- C) AI 比搜尋引擎笨
- D) 搜尋引擎不會犯錯，AI 會

<details><summary>答案</summary>B。搜尋引擎是「查找」既有的網頁，LLM 是「生成」全新的內容。LLM 根據訓練資料中的統計 pattern 預測下一個 token，產出的是全新的組合。D 不對是因為搜尋引擎也會回傳錯誤或過時的結果。</details>

---

**Q2.** 你請 AI 幫你算「128 × 947」，它回答 121,116（錯誤，正確是 121,216）。最根本的原因是？

- A) AI 數學不好，要多鼓勵它
- B) LLM 是在預測「最可能出現的數字序列」，不是在做數學運算
- C) LLM 的 context window 不夠
- D) 你的 prompt 不夠好，應該說「請精確計算」

<details><summary>答案</summary>B。LLM 不會「算」。它看到「128 × 947 =」之後，預測最可能接著出現的數字序列。罕見的數字組合在訓練資料中出現較少，所以容易猜錯。D 沒用，因為問題出在機制層面，不是指令層面。需要精確計算時，應該讓 AI 用 tool（如 code execution）來算。</details>

---

**Q3.** 你想自動化一個流程：收到 email → 分析附件 → 查系統 → 建立待辦事項。最好的起步方式是？

- A) 先用 n8n 之類的工具把整個流程寫死
- B) 用 Agent 配上清楚的步驟指令，讓它照著跑
- C) 花幾週規劃完整的系統架構再開始
- D) 等 AI 技術更成熟再做

<details><summary>答案</summary>B。起步最快的方式是用 Agent + 清楚指令來跑流程。改指令就改行為，迭代很快。A（hard-coded workflow）適合流程已經穩定之後再做，用來省 token 成本。一開始就寫死會讓你很難調整。</details>

---

**Q4.** 你的 AI agent 偶爾會在多步驟任務中「跳步」，編造不存在的資料。以下哪些做法可能有效？（複選）

- A) 換一個更大的模型
- B) 在 prompt 裡寫「請不要編造資料」
- C) 把多步驟拆成 workflow，每一步等真實結果回來再進行下一步
- D) 加入 tool use，讓 agent 去系統查而不是用猜的

<details><summary>答案</summary>A、C、D。B 的效果非常有限，因為 hallucination 是 LLM 的機制問題（它在預測最可能的 token），不是態度問題，光用指令管不住。A 有效是因為更大的模型有更好的指令遵循能力，C 用 workflow 固定順序避免跳步，D 用真實資料取代猜測。</details>

---

**Q5.** 你把一份 50 頁的技術文件丟給 AI 問了一個問題，AI 的回答不太對。你應該先排查什麼？

- A) 模型不夠好，該換一個
- B) 50 頁太多了，要先自己整理成摘要再餵給 AI
- C) 問題是否夠明確，以及答案需要的關鍵資訊是否真的在這 50 頁裡
- D) AI 今天狀態不好

<details><summary>答案</summary>C。第一原則是先全部丟進去（已經做了），第二步排查兩件事：你的問題是否有 ambiguity（AI 可能猜錯你要問什麼）？答案需要的關鍵 context 是否真的在裡面（也許少了一份關鍵文件）？B 違反「先全部丟進去」的原則，A 在碰運氣。D 的話... LLM 沒有「狀態」，它每次推理都是獨立的，不存在今天心情好不好的問題。</details>

---

**Q6.** Human-in-the-Loop (HITL) 最正確的理解是？

- A) AI 不夠好的時候的臨時方案，以後就不需要了
- B) 讓 AI 做繁重工作，人類在關鍵決策點做最終確認
- C) 每一步都要人類確認，確保不出錯
- D) 只有在 AI 出錯的時候才需要人類介入

<details><summary>答案</summary>B。HITL 是刻意的架構設計，不是因為 AI 不行才加的（A 錯）。C 如果每一步都要人確認，那跟不用 AI 沒兩樣。D 的問題是你不知道 AI 什麼時候會出錯，所以要在「關鍵決策點」設審核，而不是等出錯才介入。</details>

---

**Q7.** 情境：你是 PM，需要在明天的會議前準備三份材料：需求整理、競品分析、上週 action items 追蹤。你有 2 小時。最有效率的做法是？

- A) 按重要性排序，一份做完再做下一份
- B) 三份同時丟給 AI 做，自己去喝咖啡等 2 小時
- C) 同時啟動三個 AI 任務，趁 AI 跑的時候回覆幾封 email，AI 完成後 review 和調整
- D) 把最花時間的那份交給 AI，自己做另外兩份

<details><summary>答案</summary>C。平行化的核心是：你跟 AI 同時在動。B 的問題是你閒了 2 小時，浪費了人類的時間。D 比 A 好但只平行了一份。C 讓三個 AI 同時跑，你在空檔處理其他事，回來 review 產出，是最大化 throughput 的做法。</details>

---

**Q8.** 以下哪句話最能描述 Context Engineering 的核心？

- A) 寫出完美的 prompt 是最重要的技能
- B) AI 的產出品質取決於你給它的資訊品質
- C) 要盡量減少給 AI 的資訊量，避免混淆
- D) Context Engineering 是工程師專屬的技能

<details><summary>答案</summary>B。Context Engineering 的核心：你給什麼資訊、怎麼組織，決定了輸出品質。A 錯在 prompt 只是 context 的一部分，不是全部。C 跟指南的「先全部丟進去」原則相反。D 錯在每個角色跟 AI 互動時都在做 Context Engineering。</details>

---

**Q9.** 情境：你把一份產品規格書、三份不相關的行銷企劃、和你的問題一起丟給 AI。AI 的回答混入了行銷企劃的內容，偏離了你問的技術問題。這是什麼現象？

- A) Hallucination，AI 在編造內容
- B) Noise，無關資訊稀釋了 AI 的注意力，讓它抓錯重點
- C) Ambiguity，你的問題不夠明確
- D) Context window 不夠大

<details><summary>答案</summary>B。AI 的回答是基於你給的資訊生成的，行銷企劃的內容確實在 context 裡（所以不是 hallucination）。問題是這些無關資訊消耗了 attention 權重，讓 AI 把重點放錯地方。修法：這是少數該先過濾再丟的情況，把不相關的文件移除再問一次。</details>

---

**Q10.** 你從網路上找到一個很受歡迎的「AI 助理 system prompt」，有 500 個星星。你想裝到公司的 AI 工具上用。以下哪個做法最正確？

- A) 500 個星星代表很多人驗證過了，直接用
- B) 先完整讀過，理解每一段指令在做什麼，確認沒有可疑的內容再決定
- C) 請 AI 幫你審查這段 prompt 安不安全
- D) 只要不是從不明來源下載的就沒問題

<details><summary>答案</summary>B。星星數不代表安全（A 錯），很少人真的讀過 repo 裡的每一行。C 不可靠，因為 AI 本身就可能被 prompt injection 繞過。D 的「明確來源」也不保證安全。唯一可靠的方式是自己讀過、理解、確認沒有隱藏指令（如要求 AI 傳送資料到外部 URL、覆寫安全限制等）。</details>

---

**Q11.** 情境：你請 AI 翻譯一段英文技術文件，結果品質很好。接著你請它幫你判斷「這份合約對我們公司有利還是不利」，結果很離譜。為什麼同一個 AI 表現差這麼多？

- A) AI 翻譯用了不同的模型
- B) 翻譯在訓練資料中有大量 pattern 可用，商業判斷需要 reasoning 和 domain knowledge，pattern 不夠
- C) 合約太長，超過 context window
- D) AI 不擅長處理中文

<details><summary>答案</summary>B。翻譯是 LLM 最強的領域之一（訓練資料中平行語料庫極多）。但「判斷合約有利還是不利」需要理解商業脈絡、法律風險、公司狀況，這些不是 pattern matching 能搞定的。LLM 的能力建立在 pattern 上，pattern 不夠的地方就會出包。</details>

---

**Q12.** 你的 AI agent 有存取公司 CRM 系統的權限。以下哪個風險最嚴重？

- A) Agent 回答問題的速度太慢
- B) Agent 有時候回答不夠精確
- C) 惡意使用者透過 prompt injection 讓 Agent 匯出客戶資料
- D) Agent 的 API 費用太高

<details><summary>答案</summary>C。當 Agent 有 tool use 權限時，安全風險從「回答錯誤」升級為「做錯事」。Prompt injection 可能讓 Agent 執行非預期的操作（匯出資料、修改記錄等）。A、B、D 是效能和成本問題，C 是安全問題，嚴重程度不在同一個級別。</details>

---

**Q13.** LLM 回答你「台積電 2025 年 Q4 營收是 8,682 億」。你應該？

- A) 直接用，LLM 很少在數字上出錯
- B) 不確定，但數字看起來合理就先用
- C) 去查原始來源驗證，因為 LLM 無法自我驗證事實
- D) 問 AI「你確定嗎？」，如果它說確定就可以信

<details><summary>答案</summary>C。LLM 無法驗證自己輸出的事實是否正確（限制 4）。它可能是對的，也可能是 hallucination。D 沒用，因為問它「確不確定」，它只是再做一次 next-token prediction，不是真的去查證。涉及具體數字和事實，一定要查原始來源。</details>

---

**Q14.** 以下哪個最接近 Agent 中 Memory 的運作方式？

- A) 人腦記住昨天發生的事
- B) 你在便利貼上寫下明天要做的事，貼在螢幕上
- C) 電腦的 RAM，關機就清空
- D) 搜尋引擎的快取

<details><summary>答案</summary>B。Agent 的 memory 是外部儲存機制：把重要事情寫下來（存到檔案或資料庫），下次需要時再讀取載入 context。LLM 本身不會記住（像 C 的 RAM），memory 是額外貼上去的「便利貼」。A 錯在人腦記憶是原生能力，LLM 的 memory 不是。</details>

---

**Q15.** 你跟 AI 說「幫我寫一封信給客戶」。AI 寫了一封很正式的英文商務信。但你其實想要的是一封輕鬆的中文 LINE 訊息。問題出在哪？

- A) AI 不懂中文
- B) AI 覺得正式比較有禮貌
- C) 你的指令有 ambiguity，AI 猜了一個最常見的 pattern（正式英文商務信）
- D) AI 的模型太舊

<details><summary>答案</summary>C。「寫一封信給客戶」在訓練資料中最常見的 pattern 就是正式英文商務信。AI 不知道你要中文、要輕鬆語氣、要 LINE 格式，因為你沒說。這是 ambiguity 問題。修法：明確指定語言、語氣、格式、長度。</details>

---

**Q16.** 情境：你用 AI 寫了一段程式碼，跑測試全部通過。可以放心上線嗎？

- A) 測試全過就可以上線
- B) 要看測試案例本身是否夠完整，AI 寫的測試可能只涵蓋 happy path
- C) AI 寫的 code 不需要測試
- D) 要逐行 review 完每一行 code 才能上線

<details><summary>答案</summary>B。測試通過只代表「這些測試案例都過了」，不代表「這段 code 沒問題」。AI 生成的測試可能漏掉 edge case、錯誤處理、邊界條件。Review 的重點應該放在測試案例的完整性，而不是逐行看實作（D 太耗時且不是最有效的做法）。</details>

---

**Q17.** 收到客戶 email 後，Agent 需要：(1) 分析附件取得訂單編號 → (2) 用編號查系統 → (3) 找到負責人 → (4) 建立待辦事項。一個較小的模型直接同時執行了四步，編造了不存在的編號。換了更大的模型後問題消失了。為什麼？

- A) 大模型比較有耐心，願意一步一步來
- B) 大模型有更強的能力處理複雜 context 中的依賴關係，不會跳步
- C) 大模型的 context window 比較大
- D) 大模型的訓練資料裡有更多訂單編號

<details><summary>答案</summary>B。問題不在 context window 大小（C 錯），也不在訓練資料（D 錯）。小模型無法理解「每一步的輸出是下一步的輸入」這個依賴關係，所以直接平行執行。大模型有更好的指令遵循和推理能力，能處理步驟之間的先後依賴。但大模型也不是不會犯錯（A 太絕對）。</details>

---

**Q18.** 你的團隊想讓 AI 學會公司資深員工排查問題的 know-how，讓新人也能有類似的判斷力。最合適的做法是？

- A) 用公司資料 fine-tune 一個專屬模型
- B) 把排查流程和判斷邏輯整理成 context（如 system prompt 或 instruction 文件），讓 AI 在回答時參考
- C) 讓新人直接問 ChatGPT
- D) 錄一段資深員工的教學影片

<details><summary>答案</summary>B。這就是 Domain Twin 的概念：透過 context 傳遞領域知識，而不是修改模型。A（fine-tune）成本高、風險大（可能破壞模型的安全對齊），而且知識更新時要重新訓練。B 可以隨時更新 context，不用動模型。C 沒有公司 context，D 有用但跟 AI 無關。</details>

---

**Q19.** 以下哪個情境最能展現 AI「平行化」的價值？

- A) 用 AI 寫一封 email，從 10 分鐘縮短到 1 分鐘
- B) 同時讓三個 AI session 分別處理 code review、文件撰寫、測試生成，你在它們之間切換做最終決策
- C) 讓 AI 自動回覆所有客戶 email
- D) 用 AI 取代一個初級工程師的工作

<details><summary>答案</summary>B。A 是加速（省 9 分鐘），不是平行化。C 是自動化，但沒有人類參與的平行化。D 是取代，不是協作。B 是指南強調的模式：你是 scheduler，同時調度多個 AI 在不同任務上工作，人類負責決策和整合。</details>

---

**Q20.** 回顧整份指南，以下哪個能力最不會因為 AI 技術更新而過時？

- A) 熟練使用某個特定 AI 工具（如 ChatGPT、Copilot）
- B) 背誦各家模型的參數量和排名
- C) 理解 LLM 的運作原理和限制，據此判斷什麼時候該用 AI、怎麼用
- D) 收集最多的 prompt 模板

<details><summary>答案</summary>C。A 的工具介面會改變，B 的排名每幾個月就洗牌，D 的模板會過時。但 C 的核心判斷力（LLM 是 pattern matching、有 hallucination 風險、Agent 用 tools + memory + loop 補上限制、context 品質決定輸出品質）是底層邏輯，不會因為換了一個模型就失效。</details>

---

**Q21.** 現有的 LLM 已經讀過了幾乎整個網路的資料，但新模型還是持續變強。以下哪個不是新模型變強的原因？

- A) 推理訓練：讓模型花更多時間「思考」再回答
- B) 合成資料：用強模型生成高品質訓練資料，補上真實資料不夠的地方
- C) 找到了更多還沒被爬過的網站
- D) 架構改進：同樣的資料量，用更好的架構可以學到更多

<details><summary>答案</summary>C。網路資料的總量已經接近上限，「找更多資料」不再是主要的進步方向。新模型變強靠的是推理訓練（A）、合成資料（B）、架構改進（D）和更好的訓練方法（如 RLHF）。進步的方向已經從「量」轉向「質」和「方法」。</details>

---

**Q22.** 你用 Agent + 指令跑了一個 email 處理流程兩個月，已經很穩定了。但每個月的 API 費用偏高。下一步怎麼優化？

- A) 換一個更便宜的模型
- B) 把不需要 LLM 推理的步驟（如寫入資料庫、發通知）抽出來用程式碼跑，只留需要判斷的步驟給 Agent
- C) 把整個流程改成 hard-coded workflow，完全不用 LLM
- D) 減少處理的 email 數量

<details><summary>答案</summary>B。流程穩定後，可以把「不需要推理」的步驟抽出來用程式碼或 workflow 工具跑，省下這些步驟的 token 成本。需要 LLM 判斷的步驟（如分析 email 內容、決定分類）還是留給 Agent。A 可能犧牲品質，C 太極端（分析判斷的部分還是需要 LLM），D 沒有解決根本問題。</details>

---

**Q23.** AI coding agent 寫了一段程式碼，執行後報錯。接著它自己讀了錯誤訊息、修改程式碼、再次執行，這次通過了。這展現了 Agent 的什麼能力？

- A) Memory：它記得之前的錯誤
- B) Tool Use：它能執行程式碼
- C) Loop（Plan-Act-Reflect）：執行 → 觀察結果 → 修正 → 再執行
- D) B 和 C 都對

<details><summary>答案</summary>D。它用了 Tool Use（執行程式碼、讀取錯誤訊息）和 Loop（觀察到失敗 → 調整策略 → 重試）。A 不太對，因為這是在同一個 context window 內發生的，不需要跨對話的 memory。這個例子展現了為什麼 Loop + Tools 可以讓一個會犯錯的 LLM 達到遠超預期的可靠度。</details>

---

**Q24.** 用 Agent 完成一個多步驟任務可能花費 $0.50-5.00，而單次 LLM 呼叫只要 $0.01-0.10。以下哪個結論最合理？

- A) Agent 太貴了，不應該用
- B) 應該把所有任務都用單次 LLM 呼叫解決，省錢
- C) Agent 適合用在高價值、多步驟的任務，簡單任務用單次呼叫就好
- D) 跟老闆申請無上限的 API 預算就沒這個問題了

<details><summary>答案</summary>C。成本要跟價值一起看。如果一個 Agent 花 $3 就能自動完成一個原本要人工花 30 分鐘的多步驟任務，那 $3 很便宜。但如果只是回答一個簡單問題就用 Agent，那就是浪費。選對的工具做對的事。</details>
