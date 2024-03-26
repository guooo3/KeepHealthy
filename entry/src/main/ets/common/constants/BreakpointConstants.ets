import BreakpointType from '../bean/BreanpointType';
export default class BreakpointConstants {
  /**
   * 小屏幕设备的 Breakpoints 标记.
   */
  static readonly BREAKPOINT_SM: string = 'sm';

  /**
   * 中等屏幕设备的 Breakpoints 标记.
   */
  static readonly BREAKPOINT_MD: string = 'md';

  /**
   * 大屏幕设备的 Breakpoints 标记.
   */
  static readonly BREAKPOINT_LG: string = 'lg';

  /**
   * 当前设备的 breakpoints 存储key
   */
  static readonly CURRENT_BREAKPOINT: string = 'currentBreakpoint';

  /**
   * 小屏幕设备宽度范围.
   */
  static readonly RANGE_SM: string = '(320vp<=width<600vp)';

  /**
   * 中屏幕设备宽度范围.
   */
  static readonly RANGE_MD: string = '(600vp<=width<840vp)';

  /**
   * 大屏幕设备宽度范围.
   */
  static readonly RANGE_LG: string = '(840vp<=width)';

  static readonly BAR_POSITION: BreakpointType<BarPosition> = new BreakpointType({
    sm: BarPosition.End,
    md: BarPosition.Start,
    lg: BarPosition.Start,
  })

  static readonly DISPLAY_COUNT: BreakpointType<number> = new BreakpointType({
    sm: 1,
    md: 1,
    lg: 2
  })

  static readonly INDICATOR: BreakpointType<boolean> = new BreakpointType({
    sm: true,
    md: true,
    lg: false
  })
}