import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
@Entry
@Component
struct ItemIndex {
  @State message: string = 'Hello World'

  build() {
    Column(){
      // 1.头部导航
      this.Header()
      // 2.列表
    }
    .height('100%')
    .width('100%')
  }

  @Builder Header(){
    Row(){
      Image($r('app.media.ic_public_back'))
        .width(30)
        .onClick(() => router.back())
      Blank()
      Text('早餐').fontSize(19).fontWeight(CommonConstants.FONT_WEIGHT_600)
    }
    .width(CommonConstants.THOUSANDTH_940)
  }
}