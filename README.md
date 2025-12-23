<img src="assets/github_banner.gif" width="100%" />

<div align="center">
  <p style="font-size: 1.2em;">
    <a href="https://nitrogen.minedojo.org/"><strong>官网</strong></a> | 
    <a href="https://huggingface.co/nvidia/NitroGen"><strong>模型</strong></a> |
    <a href="https://huggingface.co/datasets/nvidia/NitroGen"><strong>数据集</strong></a> |
    <a href="https://nitrogen.minedojo.org/assets/documents/nitrogen.pdf"><strong>论文</strong></a>
  </p>
</div>


# NitroGen

NitroGen 是一个面向通用游戏智能体的开源基础模型。这个多游戏模型接收像素输入并预测手柄操作。

NitroGen 通过行为克隆在最大规模的视频-动作游戏数据集上进行训练，该数据集完全来自互联网视频。它可以通过后训练适配到未见过的游戏。

# 安装

## 前置要求

我们**不分发游戏环境**，你必须使用自己拥有的游戏。本仓库仅支持在 **Windows 游戏**上运行智能体。你可以在 Linux 机器上部署模型推理服务，但游戏最终必须在 Windows 上运行。我们已在 Windows 11 + Python ≥ 3.12 环境下测试通过。

## 安装步骤

安装本仓库：
```bash
git clone https://github.com/MineDojo/NitroGen.git
cd NitroGen
pip install -e .
```

从 [HuggingFace](https://huggingface.co/nvidia/NitroGen) 下载 NitroGen 模型权重：
```bash
huggingface-cli download nvidia/NitroGen ng.pt --local-dir .
```

# 快速开始

首先，启动模型推理服务器：
```bash
python scripts/serve.py <ng.pt的路径>  
```

然后，在你选择的游戏上运行智能体：
```bash
python scripts/play.py --process '<游戏可执行文件名>.exe'
```

`--process` 参数必须是你想玩的游戏的准确可执行文件名。你可以通过在 Windows 任务管理器（Ctrl+Shift+Esc）中右键点击游戏进程，选择"属性"来找到它。进程名应该在"常规"选项卡中，以 `.exe` 结尾。

<!-- TODO # 论文和引用

如果你觉得我们的工作有用，请考虑引用我们！

```bibtex
@article{,
  title   = {},
  author  = {},
  year    = {},
  journal = {}
}
``` -->

**免责声明**：本项目仅用于研究目的，不是 NVIDIA 官方产品。
