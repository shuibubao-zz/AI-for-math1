# C2 — AI for Math 论文

> **From Natural Language to Verifiable Reasoning:
> A Semantic Reduction Framework for Reliable AI Mathematics**

EduSeed 挑战 `C2`（挑战 ID：`ch-20260717031343-8ot0ji`）的完整交付物。
围绕 AI4Math **可靠性**主题，产出一篇结构完整、可编译、可投稿的 LaTeX 学术论文。

---

## 一、一句话论点

现有三种提升 AI 数学可靠性的主流手段——**搜索+验证、形式化证明、可复现评估**——
都隐含地依赖一个几乎从不被显式说明、也几乎从不被测量的步骤：
把无类型的自然语言论证**规约（reduce）**成一个验证器可以接受的类型化对象。

本文称其为 **语义规约层（semantic reduction layer）**，论证它才是可靠性真正的瓶颈，
并给出两个可操作产物：**可靠性阶梯 L0–L4** 与 **12 条规约核验清单（RVC）**。

---

## 二、交付物清单

| 文件 | 说明 |
|---|---|
| **`paper.tex`** | 论文主文件，可独立编译（pdflatex / xelatex / latexmk 均可） |
| **`references.bib`** | BibTeX 库，22 篇，**全部一手可查、逐条核验，且全部被正文引用** |
| **`AI日志.md`** | 5 天 AI 协作日志（含 prompt 迭代、人工核验记录、3 个 AI 误导案例） |
| **`AAR.md`** | 七维 AAR 复盘（含 5 个 AI 误导案例与对策） |
| `README.md` | 本文件 |
| `Makefile` / `build.sh` / `build.bat` | 三种构建入口 |
| `build.log` | 本机实测编译日志（证明可编译） |
| `.gitignore` | LaTeX 辅助文件忽略规则 |

---

## 三、快速开始

### 编译（任选一种）

```bash
# 方式 1：latexmk（推荐，自动处理交叉引用与参考文献）
latexmk -pdf paper.tex

# 方式 2：经典四步
pdflatex paper.tex
bibtex   paper
pdflatex paper.tex
pdflatex paper.tex

# 方式 3：xelatex
xelatex paper.tex && bibtex paper && xelatex paper.tex && xelatex paper.tex
```

或直接用脚本：

```bash
./build.sh          # Linux / macOS / Git Bash
build.bat           # Windows
make                # 需要 make
```

### 环境要求

一份常规 TeX Live / MiKTeX 即可。用到的宏包均为广泛自带：

```
geometry  amsmath  amssymb  amsthm  graphicx  booktabs
array     xcolor   enumitem tikz    listings  hyperref
```

全文与 `.bib` **均为纯 ASCII**，避免 pdflatex + BibTeX 的编码问题。

> **⚠️ 作者名是占位符**：`paper.tex` 中 `\author{Yiran Lu}` 请按需修改。

---

## 四、论文结构

| 节 | 内容 |
|---|---|
| 摘要 | 问题、论点、贡献、边界声明 |
| §1 引言 | 背景、三层论点、5 项贡献、**范围与诚实声明** |
| §2 相关工作 | 四类：非形式推理 / 验证与过程监督 / 形式化与自动形式化 / 神经符号与工具 |
| §3 三层模型 | Definition 1（对象与接口）、**Prop 1（规约鸿沟）**、**Prop 2（最弱层上界）** |
| §4 规约瓶颈 | 为何是第 2 层；**F1–F7 失败模式分类表**（含"验证层能否察觉"列） |
| §5 提出框架 | 类型化 IR 设计、双向对齐、**可靠性阶梯 L0–L4**、**12 条 RVC**、RFI 指标（提议） |
| §6 重读文献 | **tier gap 重读表**：已发表结果的"证据层级" vs "被读成的层级" |
| §7 案例 | 构造案例 `(x²−1)/(x−1)=x+1`，演示 L0–L2 全部通过、L3 报警、L4 拒绝 |
| §8 协议 | **预注册但未执行**的规约保真度测量方案（含样本量计算与证伪条件） |
| §9 局限 | 6 条威胁到效度的因素 |
| §10 结论 | 核心主张 + "公布 tier"的廉价建议 |
| 附录 A | **溯源与核验留痕表**（每条外部数值 claim 的来源与核验方式）+ 2 处声明的修正 |

**原创贡献（7 项）**
1. 三层模型的形式化接口（Definition 1）
2. Proposition 1：验证器可靠性不跨不忠实规约传递
3. Proposition 2：端到端可靠率 ≤ 最弱层
4. F1–F7 规约失败模式分类（含"Layer-3 信号"维度）
5. **可靠性阶梯 L0–L4**
6. **12 条规约核验清单 RVC**
7. 发表结果的 tier gap 重读 + 预注册测量协议

---

## 五、严谨性声明（重要）

本挑战的红线是**引用造假 → 研究严谨性 0 分**。本交付物的处理：

- **22 篇文献全部逐条核验**，来源为 arXiv 摘要页 / 出版商页面 / ADS·PubMed·DBLP 等权威索引；
  逐条留痕见 `paper.tex` **附录 A**。
- **无法确认的信息一律降级，绝不编造**：
  - ProofNet 的期刊版本无法确认 → 仅按 arXiv preprint 引用，并在附录声明；
  - AlphaProof 的 Nature 卷期页码无法确认 → 仅给 DOI；
  - Minerva 在 MATH 上的具体数字只见于二手报道 → 改为定性表述。
- **不报告任何新的实验结果**：§7 案例明确标注 constructed，§8 协议明确标注 not executed，
  Lean 代码片段标注 not type-checked。
- 所有失误与降级都在附录 A 的 **Declared corrections** 中主动披露，而非静默修正。

---

## 六、从本仓库复现编译环境（本机踩坑记录）

本机原本无 TeX 环境，且网络出口为白名单代理。最终可行的路径记录如下，供复现参考：

1. **不要用 GitHub release 直链**（代理对 `github.com` 返回 502）。
   改用 GitHub **API asset 端点**：
   ```
   curl -L -H "Accept: application/octet-stream" \
        -o out.zip https://api.github.com/repos/OWNER/REPO/releases/assets/ASSET_ID
   ```
2. **tectonic 的 TeX bundle 域名不通**，故放弃 tectonic，改用 TeX Live。
3. **走 CTAN 国内镜像**（`mirrors.ustc.edu.cn` / `mirrors.aliyun.com` 可用；主站不通）。
4. **所有构建类工具必须放在 ASCII 路径**：TeX Live 安装器是 Perl 脚本，
   在含中文的路径下会以 `Can't open perl script ... 多字节代码页` 崩溃。
5. **显式设置临时目录与 locale**：`TMP/TEMP=<ASCII dir>`、`LC_ALL=C`。
6. profile 中不要写安装器不识别的键（如 `tlpdbopt_generate_upmap`），否则安装器会直接中止。

---

## 七、提交到 GitHub

本文件夹已可直接作为仓库根目录使用（`.gitignore` 已配好，PDF 刻意纳入版本控制）：

```bash
cd C2
git init
git add .
git commit -m "C2: AI for Math paper (semantic reduction framework)"
git remote add origin <你的仓库地址>
git branch -M main
git push -u origin main
```

仓库将包含 10 个文件：4 个必需交付物（`paper.tex`、`references.bib`、`AI日志.md`、`AAR.md`）
+ `README.md` + 3 个构建入口 + `build.log` + `.gitignore`，以及作为编译证据的 `paper.pdf`。

---

## 八、一句话摘要（给评审）

> AI 数学流水线的可靠性由三层决定——生成、语义规约、验证；
> 中间层是唯一"两端都看不见"的静默失效点，因此验证器的可靠性不能跨不忠实的规约传递给用户的原始主张。
> 本文给出两个可直接使用的审计工具（L0–L4 阶梯、12 条 RVC），并用它们重读近期文献，
> 揭示了一个系统性的 **tier gap**：头条数字通常只在 L0–L2 上成立，却被读成 L3–L4。
