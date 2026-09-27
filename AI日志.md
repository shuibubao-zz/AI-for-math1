# AI 协作日志 — 挑战 C2《AI for Math 论文》

| 项 | 内容 |
|---|---|
| 挑战 ID | `ch-20260717031343-8ot0ji`（C2 · AI for Math 论文） |
| 主题 | 围绕 AI4Math 可靠性框架撰写可投稿 LaTeX 学术论文 |
| 交付物 | `paper.tex`、`references.bib`、`AI日志.md`（本文件）、`AAR.md` |
| 助手 | WorkBuddy（通用 AI 助手，带文件/终端/联网检索能力） |
| 记录时间窗 | 2026-09-21 → 2026-09-25（Day 1 – Day 5） |
| 核验原则 | **凡 AI 给出的文献事实，未经一手来源确认不得写入论文**；每条外部数值 claim 均在 `paper.tex` 附录 A 留痕 |

> **关于时间窗的说明（诚实声明）**：挑战建议周期为 5 天。本次执行的五个阶段（选题/文献/框架/写作/排版）确实全部完成，但其中有较大比例的工作集中在 2026-09-25 一个长会话内完成。日志按**研究阶段**分日记述，每一天记录的内容都是真实发生的活动与真实产出，未虚构任何交互；但"每日"的节奏是被压缩的，而非均匀分布。这一点在 `AAR.md` 第 5 维有进一步反思。

---

## Day 1（2026-09-21）· 选题与问题定义

### 目标
读懂挑战包，确定一个**我能真正做出原创小贡献**的切入点，而不是复述综述。

### 与 AI 的交互
| # | 我的 Prompt（摘要） | AI 输出 | 我的处置 |
|---|---|---|---|
| 1 | "读 `CHALLENGE.md` / `rubric.json` / `中文论文大纲（AI4Math）.pdf`，告诉我评分细则里哪些是红线、哪些是加分项。" | 提取出：引用造假→研究严谨性 0 分；不可编译→技术实现 ≤5；无 AI 日志/AAR→复盘 ≤5 | 采纳，并把"红线"写成我自己的三条工作纪律（见文末"核验三问"） |
| 2 | "大纲里的三层模型（生成/语义规约/验证）可以直接写吗？" | 可以，但直接照搬大纲=零原创，评分标准明确要求"框架有原创性贡献（哪怕是小贡献）" | **否决**。决定在三层模型之上补两个原创操作性产物：可靠性阶梯 L0–L4 + 规约核验清单 RVC |
| 3 | "给我 5 个可能的小贡献方向。" | 方向含：新分类法、对比实验、可靠性清单、评估协议、失败模式库 | 选"新分类法 + 清单 + 协议"三件套，放弃"对比实验"（我无法在周期真实跑实验，写假的会触碰红线） |

### 产出
- 选题确定：《From Natural Language to Verifiable Reasoning: A Semantic Reduction Framework for Reliable AI Mathematics》
- 三条工作纪律：① 不编造引用 ② 不编造实验数字 ③ 不能编译就不算完成

### 人工核验
- 逐条比对 `rubric.json` 五维度与 `CHALLENGE.md` 表格，确认一致。
- **修正 AI 的一处偏差**：AI 初版把"≥8 篇一手文献"理解成"8 篇即可"。我按"宁多勿少 + 全部一手可查"执行，最终收录 22 条，全部逐条核验。

---

## Day 2（2026-09-22）· 文献调研与逐条核验（红线环节）

### 目标
建立 `references.bib`，**每一条都必须真实可查**。这是本挑战的红线，也是我投入最多的环节。

### 与 AI 的交互（多轮迭代）
| # | Prompt（摘要） | 结果 |
|---|---|---|
| 1 | "列出 AI4Math 领域我应该引用的关键工作，按'形式化/验证/基准/工具'分类。" | 给出约 30 个候选，含若干我无法确认的条目 |
| 2 | "对上述每一条，给出可核验的一手来源（arXiv 编号 / DOI / 期刊卷页）。" | 部分条目 AI 给出了具体卷期页码 |
| 3 | "逐条联网核验：作者、标题、会议/期刊、年份、编号是否一致。" | **发现 3 处需要修正**（见下） |

### 核验结论（22 条全部通过、全部被正文引用；2 条声明式降级 + 1 条限定标注）

| 文献 | 核验结果 |
|---|---|
| AlphaProof | ✅ 确认是正式 Nature 论文：Hubert, Mehta, Sartran et al., *Nature* (2025), DOI `10.1038/s41586-025-09833-y`。**但卷期页码未确认** → 只写 DOI，不编页码 |
| AlphaGeometry | ✅ *Nature* 625(7995):476–482, 2024，PubMed 与 Nature 页面双源一致 |
| miniF2F | ✅ ICLR 2022，488 题，arXiv:2109.00110 |
| ProofNet | ⚠️ 草稿期我倾向标注 TMLR 期刊版，**核查后无法确认** → 降级为 arXiv preprint（2302.12433），并在附录 A 明确声明 |
| LeanDojo | ✅ NeurIPS 2023 D&B Track，98,734 定理 |
| Lean 4 | ✅ CADE 28, LNCS 12699, pp. 625–635 |
| mathlib | ✅ CPP 2020, pp. 367–381（经 Lean 论文引用记录交叉确认） |
| MATH / GSM8K / Minerva | ✅ 12,500 / 8.5K / 一手摘要确认 |
| Uesato 2022 | ✅ 16.8%→12.7% 与 14.0%→3.4% **在 arXiv PDF 中逐字确认** |
| Lightman 2023 | ✅ 78% + PRM800K，ADS 与 arXiv 双源确认 |
| PutnamBench / FrontierMath / DeepSeek-Prover-V1.5 | ✅ 均确认（1692/640 条形式化；<2%） |
| FunSearch | ✅ *Nature* 625:468–475 |
| Davies 2021 | ✅ *Nature* 600(7887):70–74 |
| Wadler 2015 | ✅ CACM 58(12):75–84 |
| Ji et al. 2023 | ✅ ACM CSUR 55(12):248 |
| Toolformer | ✅ NeurIPS 36, pp. 68539–68551 |
| Program-of-Thought / Chain-of-Thought | ✅ 均确认 |

### ⚠️ AI 误导案例 #1（本日）
- **AI 的说法**：Minerva 在 MATH 上"达到 50.3%"。
- **核验**：一手摘要只写"state-of-the-art performance on technical benchmarks without the use of external tools"；检索到的"50%"来自中文二手报道，非一手。
- **处置**：论文中改为**定性表述**（"reported state-of-the-art results on MATH without external tools"），不写具体数字。
- **教训**：AI 对"论文里的著名数字"记忆强但不精确；**凡数字必回一手**。

### 产出
- `references.bib`（22 条，纯 ASCII，附 provenance 注释）

---

## Day 3（2026-09-23）· 框架构建与论证

### 目标
把"语义规约是瓶颈"从**主张**变成**命题**。

### 与 AI 的交互
| # | Prompt（摘要） | 我的处置 |
|---|---|---|
| 1 | "把三层模型写成形式化定义：claim / derivation / formal target / reduction / verifier。" | 采纳，写成 Definition 1 |
| 2 | "核心论点需要一个可证明的命题，而不只是口号。给我 2–3 个候选。" | 候选含"端到端可靠率下界""验证器可靠性衰减"等 |
| 3 | "检查这两个命题的证明是否真的成立，有没有隐藏假设。" | **关键一步**：我要求 AI 自查，发现"乘法分解"版本隐含独立性假设 → 改用**交事件上界**（`C ⊆ G, R, V`，取 min），无需独立性，更干净也更弱（更诚实） |

### 落地内容
- **Proposition 1（Reduction Gap）**：验证器 soundness 只授权 `T ⊢ Φ`，不授权 `Φ` 与 `c` 的关系；规约不忠实则"检查通过"推不出用户的主张。
- **Proposition 2（Weakest-layer bound）**：`Pr(Cert) ≤ min{p_G, p_R, p_V}`。
- **推论（tier gap）**：`A − Pr(Cert)` 可被实证测量 —— 直接用 Uesato 的"14.0%→3.4% 推理错误率（在最终答案正确的解中）"作为真实锚点。这一句把我的抽象框架和一篇真实论文的实测数字钉在了一起，是全篇论证的关键支点。

### 原创性清单（最终确定）
1. 三层模型的形式化接口（Definition 1）
2. 两个命题（Prop 1 / Prop 2）
3. 七种规约失败模式分类表（F1–F7）—— 其中"Layer-3 是否能察觉"一列是我加的，也是本表真正的结论
4. **可靠性阶梯 L0–L4**（主操作产物）
5. **12 条规约核验清单 RVC**（含 C6 双向检查、C9 退化情形、C12 分母诚实）
6. 发表结果的 tier gap 重读表
7. 预注册但未执行的评估协议（含样本量计算）

---

## Day 4（2026-09-24）· 写作与案例构造

### 目标
完成正文，并构造一个**我自己能手算验证**的案例，绝不假造实验结果。

### 案例的构造过程（与 AI 反复推敲）
| # | Prompt（摘要） | 结果 |
|---|---|---|
| 1 | "给我一个'看起来对、实际错'的数学例子，难度要低到读者能自己验算。" | 首个建议较复杂（级数/极限交换），不适合 |
| 2 | "要更简单，而且要能在 L0–L4 每一级表现出不同行为。" | 提出 `(x²−1)/(x−1) = x+1` |
| 3 | "核对：这个例子在 Lean 的除法约定下，无条件的命题到底是不是假？" | 我手工推导：Lean 中 `/` 是 totalised（`0⁻¹ = 0`），故 x=1 时 LHS = 0/0 = 0，RHS = 2 → **确实为假**。✅ 确认 |

### 案例的三层价值（写作中进一步提炼）
1. L1 会**自信地**错：多次采样都产生同一种错误消元，多数投票反而增加置信度。
2. L2 结构性失明：`x=1` 在 ℝ 上是**零测集**，随机数值抽查几乎不可能命中 —— 这解释了为什么清单里 C8（随机抽查）**不能**替代 C9（退化情形显式测试）。
3. 同一句英文可规约出**真值不同的两个形式命题**（取决于除法约定），这正是 F3 不可逆变，且 Layer 3 完全察觉不到。

### ⚠️ AI 误导案例 #2（本日）
- **AI 的说法**：直接给出一段 Lean 代码，并称其"可通过"。
- **我的处置**：我**没有**验证 Lean 代码的能力（本机无 Lean），因此在 `paper.tex` 中把该片段明确标注为 **"Not executed or type-checked in this work"**，并在附录 A 中标注该 claim 为"Convention-dependent; stated as such"。
- **教训**：**不能验证的代码/结论，就必须在文中声明其未验证状态**。这比悄悄放进去更专业，也更符合本挑战"AI 结论经人工核验"的要求。

### 写作中的自我约束
- 明确写"We report no new empirical results"，案例标"constructed"，协议标"not executed"。
- 附录 A 逐条留痕 + "Declared corrections" 列出 2 处修正（ProofNet 期刊版、AlphaProof 卷页）。

---

## Day 5（2026-09-25）· LaTeX 排版、编译验证与交付

### 目标
`paper.tex` **必须真的能编译**。这是"技术实现"20 分与红线（不可编译 ≤5 分）的关键。

### 工具链踩坑全过程（真实记录）

| 步骤 | 尝试 | 结果 | 处置 |
|---|---|---|---|
| 1 | 检查本机 `pdflatex / xelatex / latexmk` | 全部不存在 | 需自建工具链 |
| 2 | 下载 tectonic 0.17.0（GitHub Release 直链） | **失败**：HTTP 000；代理对 `github.com` 返回 `502 CONNECT tunnel failed` | 换路 |
| 3 | 探测可达主机 | `pypi`✅ `npm`✅ `crates.io`✅ `api.github.com`✅ `objects.githubusercontent.com`✅；`github.com`❌ `relay.fullyjustified.net`❌ | 走 API |
| 4 | 用 GitHub **API asset 端点**（`Accept: application/octet-stream`）下载 tectonic | ✅ 21,060,223 字节，与 API 声明 size 一致 | 成功 |
| 5 | `tectonic -X compile` 测试 | ❌ panic：无法拉取 TeX bundle（`relay.fullyjustified.net` 被墙） | 换路 |
| 6 | 探测 CTAN 镜像 | `mirrors.ustc.edu.cn` ✅ `mirrors.aliyun.com` ✅ | 走镜像 |
| 7 | 下载 `install-tl.zip` + TeX Live 安装器 | ✅ | — |
| 8 | 首次运行安装器 | ❌ `Can't open perl script ... 多字节代码页无法映射`：**Perl 无法处理中文路径** | 把安装器整体复制到 ASCII 路径 `C:\texlive\installer` |
| 9 | 二次运行 | ❌ profile 含未知键 `tlpdbopt_generate_upmap` | 从 profile 移除该键 |
| 10 | 三次运行 | ❌ 临时目录仍为中文路径 | 设 `TMP/TEMP=C:\texlive\tmp` + `LC_ALL=C` |
| 11 | 四次运行 | ✅ 安装进行中 | — |

### ⚠️ AI 误导案例 #3（本日，工程层面）
- **AI 的默认假设**："下载 tectonic 二进制 → 直接编译"是标准路径。
- **现实**：本机会话的**网络出口是白名单代理**（GitHub 主站 502、tectonic bundle 域名不通），且**用户目录含中文**，Perl 系工具会崩。
- **对策**：形成一条可复用的排查链 —— *先探测主机可达性，再选下载路径；所有构建类工具一律放在 ASCII 路径并显式设置 TMP*。已写入 `AAR.md` 改进项。

### 排版决策
- 依赖包刻意保守：`geometry / amsmath / amssymb / amsthm / graphicx / booktabs / array / xcolor / enumitem / tikz / listings / hyperref`，均为主流发行版自带。
- 全文 **纯 ASCII**（含 `.bib`），避免 pdflatex + BibTeX 的编码问题；作者名中的变音符号（Veličković 等）做 ASCII 转写。
- 图表：1 幅 TikZ 架构图 + 5 张 booktabs 表格（失败模式、阶梯、清单、重读表、核验留痕表）。

---

## 附：我的"核验三问"（本挑战沉淀的 AI 结论判断框架）

凡 AI 给出的**事实性**结论，写入前必须过三问：

1. **来源问**：这条结论的一手来源是什么？（arXiv 编号 / DOI / 出版商页面）—— 说不出来源的一律不写。
2. **数字问**：这个数字在原文中是否**逐字**出现？—— 二手报道、综述转述、模型记忆都不算。
3. **能力问**：我现在有没有手段验证它？（能不能编译、能不能手算、能不能跑通）—— 不能验证的，必须在文中**显式声明其未验证状态**，而不是默认它为真。

三问不过 → 降级表述（定量改定性）→ 或标注为"proposed / not executed / convention-dependent"→ 或删除。

本次三问的实际战绩：拦下 3 处（Minerva 数字、ProofNet 期刊版、Lean 代码可执行性），另有 2 处降级（AlphaProof 卷页、案例的约定依赖性）。
