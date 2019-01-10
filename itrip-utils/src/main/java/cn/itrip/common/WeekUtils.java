package cn.itrip.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class WeekUtils {
    /***
     *获取当前日期是星期几
     */
    public static Integer getWeekOfDate(Date date) {
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int w = cal.get(Calendar.DAY_OF_WEEK);
     if (w < 0)
            w = 0;
        return w;
    }


    public static void main(String[] args) throws ParseException {
        WeekUtils weekUtils = new WeekUtils();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
      int count = weekUtils.getWeekOfDate(sdf.parse("2017-07-15"));
        System.out.println(count);
    }
}
