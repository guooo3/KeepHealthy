import { CommonConstants } from '../../common/constants/CommonConstants'

@CustomDialog
export default struct DatePickDialog {
  controller: CustomDialogController
  selectedDate: Date = new Date()

  build() {
    Column({ space: CommonConstants.SPACE_12 }) {
      //1.日期选择器
      DatePicker({
        start: new Date('2020-1-1'),
        end: new Date(),
        selected: this.selectedDate
      })
        .onChange((value: DatePickerResult) => {
          this.selectedDate.setFullYear(value.year, value.month, value.day)
        })

      //2.按钮
      Row({ space: CommonConstants.SPACE_12 }) {
        Button("取消")
          .backgroundColor($r('app.color.light_gray'))
          .width(120)
          .onClick(() => this.controller.close())
        Button("确认")
          .backgroundColor($r('app.color.primary_color'))
          .width(120)
          .onClick(() => {
            //1.保存日期到全局存储
            AppStorage.SetOrCreate('selectedDate', this.selectedDate.getTime())
            //2.关闭窗口
            this.controller.close()
          })
      }
    }
    .padding(CommonConstants.SPACE_12)

  }
}