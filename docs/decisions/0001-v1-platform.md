# 决策 0001：V1 使用 HarmonyOS 原生应用

- 日期：2026-08-05
- 状态：已确认

## 已知条件

- 目标设备：HUAWEI Pura 90
- 系统：HarmonyOS 6.1.1（API 24）
- 主要测试城市：北京
- 分发方式：仅个人测试
- 当前目标：先让核心功能作为普通应用跑通
- 暂不考虑：耳机适配、后台常驻、热词唤醒、应用市场上架

## 决策

客户端使用 ArkTS + ArkUI 开发 HarmonyOS 原生 HAP，不开发 Android APK。首个交互入口为 App 内“说话”按钮，并提供文字输入兜底。

首版能力映射：

- 登录：Account Kit
- 语音识别与合成：Core Speech Kit
- 定位：Location Kit
- 地点能力：Map Kit/Site 能力，餐厅数据不足时由服务端高德 POI 补充
- 电话：Telephony Kit 拉起系统电话流程
- 云端记忆与推荐：独立后端 API，避免客户端和业务数据绑定

## 理由

目标手机与系统已经明确，HarmonyOS 原生方案能直接使用当前系统能力，避免 Android 兼容层的不确定性。独立后端继续保留跨设备扩展能力；将耳机与热词入口延后，可以先验证真正的产品核心——记住偏好、推荐北京附近餐厅并拨打商家电话。

## 影响

- 开发工具由 Android Studio 改为 DevEco Studio。
- 客户端语言由 Kotlin 改为 ArkTS。
- 安装包由 APK 改为 HAP。
- 第一期验收不包含锁屏唤醒和耳机按键。
