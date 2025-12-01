// =================================================================
// 全局配置文件
// 统一管理字体、字号、颜色、间距等配置
// =================================================================

// --- 字体配置 ---
#let fonts = (
  // 中文字体
  song: ("SimSun",),
  hei: ("SimHei",),
  fangsong: ("FangSong", "STFangsong", "FangSong_GB2312"),
  kaiti: ("KaiTi", "STKaiti", "KaiTi_GB2312"),
  // 英文字体
  en-main: "Times New Roman",
  en-sans: "Arial",
  // 混合字体（英文+中文）
  main: ("Times New Roman", "SimSun"),
  hei-mix: ("Times New Roman", "SimHei"),
  fangsong-mix: ("Times New Roman", "FangSong", "STFangsong", "FangSong_GB2312"),
)

// --- 字号配置（按照 Word 标准）---
#let font-sizes = (
  // 常用字号
  chuhao: 42pt, // 初号
  xiaochu: 36pt, // 小初
  yihao: 26pt, // 一号
  xiaoyihao: 24pt, // 小一
  erhao: 22pt, // 二号
  xiaoerhao: 18pt, // 小二
  sanhao: 16pt, // 三号
  xiaosan: 15pt, // 小三
  sihao: 14pt, // 四号
  xiaosi: 12pt, // 小四
  wuhao: 10.5pt, // 五号
  xiaowu: 9pt, // 小五
  liuhao: 7.5pt, // 六号
  xiaoliu: 6.5pt, // 小六
  qihao: 5.5pt, // 七号
)

// --- 颜色配置 ---
#let colors = (
  black: rgb("#000000"),
  white: rgb("#FFFFFF"),
  gray: rgb("#808080"),
  light-gray: rgb("#D3D3D3"),
  // 主题色
  primary: rgb("#1f4788"),
  secondary: rgb("#4472c4"),
  accent: rgb("#c55a11"),
)

// --- 页面配置 ---
#let page-config = (
  // A4 纸张边距
  margin-top: 3cm,
  margin-bottom: 2.5cm,
  margin-left: 3.17cm,
  margin-right: 3.17cm,
  // 页眉页脚
  header-height: 1.5cm,
  footer-height: 1.5cm,
)

// --- 页码配置 ---
#let page-number-config = (
  // 页码字体和字号
  font: ("Times New Roman", "SimSun"),
  size: 10.5pt,  // 五号
  // 页码位置（距离页边距）
  offset-x: 0cm,
  offset-y: 1cm,
  // 是否启用奇偶页页码位置切换（true: 奇数页右侧/偶数页左侧，false: 始终居中）
  alternate-position: true,
  // 当 alternate-position 为 false 时的对齐方式："center", "left", "right"
  default-align: "center",
)

// --- 段落配置 ---
#let paragraph-config = (
  // 行距（最小值）
  line-height: 18pt,
  // 首行缩进
  indent: (amount: 2em, all: true),
  // 段前段后间距
  spacing-above: 0pt,
  spacing-below: 0pt,
)

// --- 标题配置 ---
#let heading-config = (
  // 编号格式
  numbering: "1.1.1.1",
  // 各级标题字体和字号
  level1: (
    font: fonts.hei-mix,
    size: font-sizes.sihao,
    weight: "regular",
    spacing-above: 18pt,
    spacing-below: 18pt,
  ),
  level2: (
    font: fonts.hei-mix,
    size: font-sizes.sihao,
    weight: "regular",
    spacing-above: 18pt,
    spacing-below: 12pt,
  ),
  level3: (
    font: fonts.main,
    size: font-sizes.xiaosi,
    weight: "bold",
    spacing-above: 12pt,
    spacing-below: 12pt,
  ),
  level4: (
    font: fonts.main,
    size: font-sizes.xiaosi,
    weight: "regular",
    spacing-above: 12pt,
    spacing-below: 12pt,
  ),
)

// --- 图表配置 ---
#let figure-config = (
  // 图表标题
  caption-font: fonts.hei-mix,
  caption-size: font-sizes.xiaosi,
  caption-align: center,
  // 图表间距
  table-spacing-above: 18pt,
  table-spacing-below: 18pt,
  image-spacing-above: 12pt,
  image-spacing-below: 18pt,
  // 图表内容字号
  table-content-size: font-sizes.xiaowu,
  table-line-spacing: 0.65em,
)

// --- 封面配置 ---
#let cover-config = (
  // 标题字号
  title-size: font-sizes.yihao,
  title-font: fonts.hei,
  // 信息字段字号
  label-size: font-sizes.sanhao,
  label-font: fonts.hei,
  value-size: font-sizes.sanhao,
  value-font: fonts.fangsong,
  // 垂直间距
  title-top-spacing: 2cm,
  title-bottom-spacing: 5cm,
  field-row-gap: 1.2cm,
  field-underline-width: 11cm,
)
