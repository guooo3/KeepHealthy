import { CommonConstants } from '../../common/constants/CommonConstants'

@Component
export default struct CalorieStats {
  intake: number = 192
  expend: number = 150
  recommend: number = CommonConstants.RECOMMEND_CALORIE

  remainCalorie() {
    return this.recommend - this.intake + this.expend
  }

  build() {
    Row({ space: CommonConstants.SPACE_6 }) {
      // 1.饮食摄入
      this.StatsBuilder('饮食摄入', this.intake)
      // 2.还可以吃
      Stack() {
        //2.1.进度条
        Progress({
          value: this.intake,
          total: this.recommend,
          type: ProgressType.Ring
        })
          .width(120)
          .style({ strokeWidth: CommonConstants.DEFAULT_8 })
          .color($r('app.color.primary_color'))
        //2.2.统计数据
        this.StatsBuilder('还可以吃', this.remainCalorie(), `推荐${this.recommend}千卡`)
      }
      // 3.运动消耗
      this.StatsBuilder('运动消耗', this.expend)
    }
    .width('100%')
    .justifyContent(FlexAlign.SpaceEvenly)
    .padding({ top: 30, bottom: 35 })
  }

  @Builder StatsBuilder(label: string, value: number, tips?: string) {
    Column({ space: CommonConstants.SPACE_6 }) {
      Text(label)
        .fontColor($r('app.color.gray'))
        .fontWeight(CommonConstants.FONT_WEIGHT_600)
      Text(value.toString())
        .fontSize(20)
        .fontWeight(CommonConstants.FONT_WEIGHT_700)
      if (tips) {
        Text(tips)
          .fontSize(12)
          .fontColor($r('app.color.light_gray'))
      }
    }
  }
}