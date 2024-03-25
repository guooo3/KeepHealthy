import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import ItemCard from '../view/Item/ItemCard'
import ItemList from '../view/Item/ItemList'
import ItemPanelHeader from '../view/Item/ItemPanelHeader'

@Entry
@Component
struct ItemIndex {
  @State amount: number = 1
  @State showPanel: boolean = false

  build() {
    Column() {
      // 1.头部导航
      this.Header()
      // 2.列表
      ItemList({ showPanel: $showPanel })
        .layoutWeight(1)
      // 3.底部面板
      Panel(this.showPanel) {
        Button('关闭').onClick(() => this.showPanel = false)

        // 3.1.顶部日期
        ItemPanelHeader()
        // 3.2.记录项卡片
        ItemCard({ amount: this.amount })
        // 3.3.数字键盘

        // 3.4.底部按钮
      }
      .mode(PanelMode.Full)
      .type(PanelType.Minibar)
      .dragBar(false)
      .backgroundMask($r('app.color.light_gray'))
      .backgroundColor(Color.White)
    }
    .height('100%')
    .width('100%')
  }

  @Builder Header() {
    Row() {
      Image($r('app.media.ic_public_back'))
        .width(24)
        .onClick(() => router.back())
      Blank()
      Text('早餐').fontSize(19).fontWeight(CommonConstants.FONT_WEIGHT_600)
    }
    .width(CommonConstants.THOUSANDTH_940)
    .height(32)
  }
}