// =================================================================
// 模板统一入口
// 导出所有模板功能，简化使用
// =================================================================

// 导入各个模块
#import "config.typ": *
#import "utils.typ": *
#import "cover.typ": cover-design
#import "report.typ": report-style, tbl-content, fig-content, enable-page-number

// =================================================================
// 导出所有功能
// =================================================================

// 1. 封面函数（直接导出，保持兼容性）
// 旧用法：#cover.cover-design(...) 或使用 (#cover.design)(...)
// 新用法：直接使用 #cover-design(...)

// 2. 正文样式函数（直接导出）
// 使用：#show: report-style
// 或者：#table-content[...], #image-content[...]

// 3. 工具函数已通过 import "utils.typ": * 自动导出
// 可以直接使用：#unnumbered-chapter("引言")

// 4. 配置已通过 import "config.typ": * 自动导出
// 可以使用：fonts.song, font-sizes.sihao 等
