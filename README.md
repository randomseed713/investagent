# 全栈AI投研Agent (Full-Stack AI Investment Research Agent)

<p align="center">
  <strong>整合5大金融投研框架的AI投研Agent</strong><br>
  从产业链分析 → 个股深度研究 → 价值投资评估 → 多Agent交易决策 → 量化回测验证<br>
  <em>覆盖A股 / 港股 / 美股</em>
</p>

---

## 架构

```
┌──────────────────────────────────────────────────┐
│              Investment Agent                     │
│           (SKILL.md 编排层)                       │
├──────────────────────────────────────────────────┤
│                                                  │
│   Serenity        Buffett        UZI-Skill      │
│   产业链瓶颈      价值投资系统     深度分析        │
│   猎手 ★731       ★512           ★2.4K          │
│                                                  │
│   TradingAgents    QuantDinger                   │
│   多Agent交易      量化回测平台                    │
│   ★86K            ★7.4K                         │
│                                                  │
└──────────────────────────────────────────────────┘
```

## 5大集成模块

| 模块 | Stars | 用途 | 输出 |
|------|-------|------|------|
| [**Serenity Skill**](https://github.com/muxu-compatible/serenity-skill) | 731 | 产业链瓶颈研究 | 8层价值链 + 稀缺层 + 20+公司池 |
| [**Buffett Skills**](https://github.com/agi-now/buffett-skills) | 512 | 价值投资评估 | 8问筛选 / 10章深度报告 |
| [**UZI-Skill**](https://github.com/wbh604/uzi-skill) | 2.4K | 个股深度分析 | Bloomberg风格HTML报告 |
| [**TradingAgents**](https://github.com/TauricResearch/TradingAgents) | 86K | 多Agent交易决策 | 多空辩论 + 交易建议 |
| [**QuantDinger**](https://github.com/brokermr810/QuantDinger) | 7.4K | 量化策略回测 | 净值曲线 + 交易明细 |

## 6条执行路径

| 路径 | 触发场景 | 执行流程 |
|------|---------|---------|
| **A** | 主题/赛道研究 | Serenity → Buffett → UZI → TradingAgents → QuantDinger |
| **B** | 个股深度研究 | Buffett → UZI → TradingAgents → QuantDinger |
| **C** | 产业链瓶颈 | Serenity 完整9步工作流 |
| **D** | 价值投资评估 | Buffett 8问筛选 → 深度分析 |
| **E** | 多Agent决策 | TradingAgents 完整流程 |
| **F** | 量化回测 | QuantDinger 策略开发 + 回测 |

## 快速开始

### 方式一：Claude Code / Codex 中使用（推荐）

1. 克隆仓库并初始化子模块：
```bash
git clone --recurse-submodules https://github.com/YOUR_USERNAME/investment-agent.git
cd investment-agent
```

2. 将 SKILL.md 复制到你的项目：
```bash
cp SKILL.md /your-project/.claude/skills/investment-agent/
```

3. 在 Claude Code 中直接对话：
```
"研究A股AI半导体赛道"
"深度分析贵州茅台"
"用巴菲特框架分析苹果"
"拆解CPO产业链找瓶颈"
```

### 方式二：命令行执行

1. 安装环境：
```bash
bash scripts/setup_env.sh
```

2. 主题研究（全流程）：
```bash
python scripts/run_research.py --theme "A股AI半导体" --market A-share
```

3. 个股深度研究：
```bash
python scripts/run_stock_analysis.py --ticker 600519.SH
```

## 目录结构

```
investment-agent/
├── SKILL.md                              # Agent主文件（编排层核心）
├── README.md                             # 本文件
├── LICENSE                               # MIT许可证
├── .gitmodules                           # Git子模块配置
├── scripts/
│   ├── run_research.py                   # 主题研究一键执行
│   ├── run_stock_analysis.py             # 个股分析一键执行
│   └── setup_env.sh                      # 环境安装脚本
├── references/
│   ├── architecture.md                   # 架构设计详解
│   └── module-interfaces.md              # 模块接口规范
├── skills/                               # 5个skill（git submodule）
│   ├── serenity-skill/                   # 产业链瓶颈猎手
│   ├── buffett-skills/                   # 价值投资思维系统
│   ├── uzi-skill/                        # 个股深度分析
│   ├── TradingAgents/                    # 多Agent交易决策
│   └── QuantDinger/                      # 量化回测平台
└── output/                               # 研究报告输出目录
```

## 环境要求

- **Python** 3.10+
- **pip**
- **Docker + Docker Compose**（QuantDinger 需要）
- **LLM API Key**（TradingAgents 需要，支持 OpenAI / Anthropic / Google / DeepSeek）

## 工作原理

本Agent的核心是一个 **SKILL.md 编排层**，它：

1. **解析用户意图** → 自动路由到合适的执行路径
2. **按需加载Skill** → 每个模块只在需要时读取其SKILL.md和参考文件
3. **串联模块输出** → 前一个模块的输出作为后一个模块的输入
4. **呈现矛盾** → 不同模块结论冲突时，强调分歧本身是信息
5. **生成结构化报告** → 统一的输出模板，包含结论/风险/验证动作

### 数据流

```
Serenity → 候选公司列表（ticker list）
    ↓
Buffett → 筛选结果（pass/fail + 理由）
    ↓
UZI → 深度分析产物（22维数据 + 65人评审 + 6种估值）
    ↓
TradingAgents → 交易决策（buy/hold/sell + 置信度）
    ↓
QuantDinger → 回测结果（净值曲线 + 指标）
```

## 致谢

本项目整合了以下优秀的开源项目：

- [Serenity Skill](https://github.com/muxu-compatible/serenity-skill) - 供应链瓶颈猎手
- [Buffett Skills](https://github.com/agi-now/buffett-skills) - 巴菲特投资思维系统
- [UZI-Skill](https://github.com/wbh604/uzi-skill) - 股票深度分析
- [TradingAgents](https://github.com/TauricResearch/TradingAgents) - 多Agent金融交易框架
- [QuantDinger](https://github.com/brokermr810/QuantDinger) - AI量化交易平台

## 免责声明

本Agent所有输出仅供研究参考，**不构成任何投资建议**。投资有风险，决策需谨慎。

## License

[MIT](LICENSE)
