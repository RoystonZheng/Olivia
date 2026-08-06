# Olivia

Olivia 是一个类似“贾维斯”的可交互私人助手：安静待命、记住用户偏好、推荐附近餐厅，并在用户要求时拉起商家电话。

## 当前状态

- 客户端：HarmonyOS 6.1.1（API 24），ArkTS + ArkUI
- 包名：`com.olivia.assistant`
- 目标设备：HUAWEI Pura 90
- 测试城市：北京
- 已完成：项目骨架、首版主页、本地文字对话演示、HAP 编译、Pura 90 虚拟机安装与启动
- 待接入：账号、云端记忆、语音、定位、餐厅数据、推荐排序、拨号任务

## 目录

- `harmony/`：HarmonyOS 客户端
- `docs/`：产品计划与技术决策
- `scripts/`：本地开发辅助脚本

## 构建

双击或在终端中运行：

```text
scripts\build-harmony.cmd
```

调试 HAP 输出到：

```text
harmony/entry/build/default/outputs/default/entry-default-unsigned.hap
```

开发与验收流程见 [Olivia V1 执行计划](docs/OLIVIA_V1_EXECUTION_PLAN.md)。
