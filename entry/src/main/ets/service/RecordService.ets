import DateUtil from '../common/utils/DateUtil'
import ItemModel from '../model/ItemModel'
import RecordModel from '../model/RecordModel'
import RecordVO from '../viewmodel/RecordVO'

class RecordService {
  insert(typeId: number, itemId: number, amount: number) {
    let createTime = (AppStorage.Get('selectedDate') || DateUtil.beginTimeOfDay(new Date())) as number
    return RecordModel.insert({ typeId, itemId, amount, createTime })
  }

  deleteById(id: number) {
    return RecordModel.deleteById(id)
  }

  async queryRecordByDate(date: number): Promise<RecordVO[]> {
    // 1. 查询数据库的RecordPO
    let rps = await RecordModel.listByDate(date)
    // 2. 将RecordPO转为RecordVO
    let rvs = rps.map(rp => {
      // 2.1 获取po中基本属性
      let rv = { id: rp.id, typeId: rp.typeId, amount: rp.amount } as RecordVO
      // 2.2 查询记录项
      rv.recordItem = ItemModel.getById(rp.itemId)
      // 2.3 计算热量
      rv.calorie = rp.amount * rv.recordItem.calorie
      return rv
    })
    return rvs
  }

  calculateStatsInfo(){

  }

}

let recordService = new RecordService()

export default recordService as RecordService