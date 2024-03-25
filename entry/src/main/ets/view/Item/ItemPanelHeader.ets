import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct ItemPanelHeader {
  build() {
    Row() {
      Text('3月25日 早餐').fontWeight(CommonConstants.FONT_WEIGHT_600)
      Image($r('app.media.ic_public_spinner'))
        .width(20)
        .fillColor(Color.Black)
    }
    // .width(CommonConstants.THOUSANDTH_940)
  }
}