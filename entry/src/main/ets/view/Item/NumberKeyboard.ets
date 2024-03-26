import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct NumberKeyboard {
  @Link amount: number
  @Link value: string
  numbers: string[] = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', '.']

  @Styles keyBoxStyle() {
    .backgroundColor(Color.White)
    .height(60)
    .borderRadius(8)
  }

  clickNumber(num: string) {
    // 1.拼接输入内容
    let val = this.value + num
    // 2.校验输入格式是否正确，如果有两个‘.’,返回。
    let firstIndex = val.indexOf('.')
    let lastIndex = val.lastIndexOf('.')
    if (firstIndex !== lastIndex || (lastIndex != -1 && lastIndex < val.length - 2)) {
      return
    }
    // 3.将字符串转为数值
    let amount = this.parseFloat(val)
    // 4.保存
    if (amount > 999.9) {
      this.amount = 999.0
      this.value = '999.0'
    } else {
      this.amount = amount
      this.value = val
    }
  }

  clickDelete() {
    if (this.value.length <= 0) {
      this.value = ''
      this.amount = 0
      return
    }
    this.value = this.value.substring(0, this.value.length - 1)
    this.amount = this.parseFloat(this.value)
  }

  parseFloat(str: string) {
    if (!str) {
      return 0
    }
    if (str.endsWith('.')) {
      str = str.substring(0, str.length - 1)
    }
    return parseFloat(str)
  }

  build() {
    Grid() {
      ForEach(this.numbers, number => {
        GridItem() {
          Text(number).fontSize(20).fontWeight(CommonConstants.FONT_WEIGHT_900)
        }
        .keyBoxStyle()
        .onClick(() => this.clickNumber(number))
      })
      GridItem() {
        Text('删除').fontSize(20).fontWeight(CommonConstants.FONT_WEIGHT_900)
      }
      .keyBoxStyle()
      .onClick(() => this.clickDelete())
    }
    .columnsTemplate('1fr 1fr 1fr')
    .width('100%')
    .height(280)
    .backgroundColor($r('app.color.index_page_background'))
    .rowsGap(8)
    .columnsGap(8)
    .padding(8)
    .margin({ top: 10 })
  }
}