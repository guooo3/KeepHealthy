import router from '@ohos.router'
import { CommonConstants } from '../common/constants/CommonConstants'
import ItemCard from '../view/Item/ItemCard'
import ItemList from '../view/Item/ItemList'
import ItemPanelHeader from '../view/Item/ItemPanelHeader'
import NumberKeyboard from '../view/Item/NumberKeyboard'
import RecordItem from '../viewmodel/RecordItem'

@Entry
@Component
struct ItemIndex {
  @State amount: number = 1
  @State value: string = ''
  @State showPanel: boolean = false
  @State item: RecordItem = null

  onPanelShow(item: RecordItem) {
    this.showPanel = true
    this.amount = 1
    this.value = ''
    this.item = item
  }
  build() {
    Column() {
      // 1.头部导航
      this.Header()
      // 2.列表
      ItemList({ showPanel: this.onPanelShow.bind(this)})
        .layoutWeight(1)
      // 3.底部面板
      Panel(this.showPanel) {
        // 3.1.顶部日期
        ItemPanelHeader()
        // 3.2.记录项卡片
        if (this.item) {
          ItemCard({ amount: this.amount,item: $item})
        }
        // 3.3.数字键盘
        NumberKeyboard({amount: $amount , value: $value})
        // 3.4.底部按钮
        Row({ space: CommonConstants.SPACE_8 }) {
          Button('取消')
            .backgroundColor($r('app.color.light_gray'))
            .width(120)
            .borderRadius(6)
            .type(ButtonType.Normal)
            .onClick(()=> this.showPanel = false)
          Button('提交')
            .backgroundColor($r('app.color.primary_color'))
            .width(120)
            .borderRadius(6)
            .type(ButtonType.Normal)
            .onClick(()=> this.showPanel = false)
        }
        .margin({top: 13})
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