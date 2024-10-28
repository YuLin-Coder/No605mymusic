package com.martinwj.mymusic.util.test;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.HashMap;
import java.util.UUID;

import com.github.abel533.echarts.axis.CategoryAxis;
import com.github.abel533.echarts.axis.ValueAxis;
import com.github.abel533.echarts.code.Magic;
import com.github.abel533.echarts.code.Tool;
import com.github.abel533.echarts.code.Trigger;
import com.github.abel533.echarts.feature.MagicType;
import com.github.abel533.echarts.json.GsonOption;
import com.github.abel533.echarts.series.Bar;
import com.github.abel533.echarts.series.Line;
import com.github.abel533.echarts.style.ItemStyle;
import com.github.abel533.echarts.style.itemstyle.Normal;
import com.google.gson.Gson;

/**
 * eachrts后台出图
 * @author: Martin（靖王）
 * @description: TODO
 * @date: 2020/11/13 22:15
 * @version: 1.0
 */
public class EchartsToPicUtils {
    //echarts包的路径  后面截图有说明
    private static final String JSpath = "E:\\project\\qinghai\\echarts-convert\\echarts-convert1.js";


    public static void main(String[] args) {
        String optiona = "{\"title\":{\"left\":\"center\",\"text\":\"草地植被演替评估\",\"padding\":30,\"textStyle\":{\"fontSize\":18,\"fontWeight\":\"bolder\",\"color\":\"#333\"},\"subtext\":\"2019-03-05 00:00:00-2020-03-04 00:00:00 全部\",\"subtextStyle\":{\"fontSize\":14,\"fontWeight\":\"bold\"}},\"legend\":{\"data\":[\"大柴旦\",\"都兰\",\"兴海\",\"河南\",\"刚察\",\"甘德\",\"杂多\",\"民和\",\"囊谦\",\"五道梁\",\"湟源\",\"久治\",\"同德\",\"湟中\",\"沙珠玉\",\"玉树\",\"乐都\",\"循化\",\"德令哈\",\"乌兰\",\"共和\",\"祁连\",\"治多\",\"贵德\",\"海晏\",\"沱沱河\",\"青海湖151\",\"门源\",\"化隆\",\"泽库\",\"同仁\",\"班玛\",\"格尔木\",\"野牛沟\",\"玛沁\",\"玛多\",\"贵南\",\"大通\",\"茫崖\",\"互助\",\"曲麻莱\",\"小灶火\",\"诺木洪\",\"清水河\",\"西宁\",\"尖扎\",\"冷湖\",\"托勒\",\"达日\",\"天峻\",\"茶卡\",\"平安\"],\"type\":\"scroll\",\"bottom\":10},\"toolbox\":{\"show\":true,\"orient\":\"vertical\",\"y\":\"45%\",\"x\":\"95%\",\"itemSize\":30},\"xAxis\":{\"name\":\"年份\",\"nameLocation\":\"middle\",\"nameTextStyle\":{\"fontSize\":16,\"padding\":15},\"type\":\"category\",\"data\":[\"2019\",\"2020\"],\"splitLine\":{\"show\":false},\"axisLabel\":{\"show\":true,\"textStyle\":{\"fontSize\":14}},\"axisLine\":{\"show\":true,\"onZero\":true,\"lineStyle\":{\"width\":2}},\"axisTick\":{\"show\":\"true\",\"lineStyle\":{\"color\":\"black\",\"width\":2,\"type\":\"solid\"}}},\"yAxis\":[{\"name\":\"结果\",\"nameLocation\":\"middle\",\"nameTextStyle\":{\"fontSize\":16,\"padding\":15},\"type\":\"value\",\"splitLine\":{\"show\":false},\"axisLabel\":{\"fontSize\":14},\"axisLine\":{\"show\":true,\"onZero\":true,\"lineStyle\":{\"width\":2}},\"axisTick\":{\"show\":\"true\",\"lineStyle\":{\"color\":\"black\",\"width\":2,\"type\":\"solid\"}}}],\"grid\":{\"top\":\"10%\",\"bottom\":\"15%\",\"left\":\"10%\",\"right\":\"10%\",\"borderColor\":\"black\",\"borderWidth\":1},\"tooltip\":{\"trigger\":\"axis\",\"axisPointer\":{\"type\":\"none\"}},\"series\":[{\"name\":\"大柴旦\",\"data\":[2306.4,0],\"type\":\"line\"},{\"name\":\"都兰\",\"data\":[2156.8,0],\"type\":\"line\"},{\"name\":\"兴海\",\"data\":[1713.7,0],\"type\":\"line\"},{\"name\":\"河南\",\"data\":[1435.3,0],\"type\":\"line\"},{\"name\":\"刚察\",\"data\":[1523,0],\"type\":\"line\"},{\"name\":\"甘德\",\"data\":[1131.1,0],\"type\":\"line\"},{\"name\":\"杂多\",\"data\":[1524.6,0],\"type\":\"line\"},{\"name\":\"民和\",\"data\":[3595.1,0],\"type\":\"line\"},{\"name\":\"囊谦\",\"data\":[2331.7,0],\"type\":\"line\"},{\"name\":\"五道梁\",\"data\":[599.6,0],\"type\":\"line\"},{\"name\":\"湟源\",\"data\":[2328,0],\"type\":\"line\"},{\"name\":\"久治\",\"data\":[1583.5,0],\"type\":\"line\"},{\"name\":\"同德\",\"data\":[1990.1,0],\"type\":\"line\"},{\"name\":\"湟中\",\"data\":[2384.8,0],\"type\":\"line\"},{\"name\":\"沙珠玉\",\"data\":[2119.9,0],\"type\":\"line\"},{\"name\":\"玉树\",\"data\":[1862.3,0],\"type\":\"line\"},{\"name\":\"乐都\",\"data\":[3312.2,0],\"type\":\"line\"},{\"name\":\"循化\",\"data\":[3727.7,0],\"type\":\"line\"},{\"name\":\"德令哈\",\"data\":[2522.5,0],\"type\":\"line\"},{\"name\":\"乌兰\",\"data\":[2402.6,0],\"type\":\"line\"},{\"name\":\"共和\",\"data\":[2461.3,0],\"type\":\"line\"},{\"name\":\"祁连\",\"data\":[1993.3,0],\"type\":\"line\"},{\"name\":\"治多\",\"data\":[1258.9,0],\"type\":\"line\"},{\"name\":\"贵德\",\"data\":[3421.9,0],\"type\":\"line\"},{\"name\":\"海晏\",\"data\":[1770.8,0],\"type\":\"line\"},{\"name\":\"沱沱河\",\"data\":[922.2,0],\"type\":\"line\"},{\"name\":\"青海湖151\",\"data\":[1822.5,0],\"type\":\"line\"},{\"name\":\"门源\",\"data\":[1903,0],\"type\":\"line\"},{\"name\":\"化隆\",\"data\":[2041.8,0],\"type\":\"line\"},{\"name\":\"泽库\",\"data\":[1227.2,0],\"type\":\"line\"},{\"name\":\"同仁\",\"data\":[2892.2,0],\"type\":\"line\"},{\"name\":\"班玛\",\"data\":[1921.5,0],\"type\":\"line\"},{\"name\":\"格尔木\",\"data\":[2918.8,0],\"type\":\"line\"},{\"name\":\"野牛沟\",\"data\":[1197.6,0],\"type\":\"line\"},{\"name\":\"玛沁\",\"data\":[1407,0],\"type\":\"line\"},{\"name\":\"玛多\",\"data\":[893.3,0],\"type\":\"line\"},{\"name\":\"贵南\",\"data\":[1954.2,0],\"type\":\"line\"},{\"name\":\"大通\",\"data\":[2451.6,0],\"type\":\"line\"},{\"name\":\"茫崖\",\"data\":[2480.6,0],\"type\":\"line\"},{\"name\":\"互助\",\"data\":[2454.6,0],\"type\":\"line\"},{\"name\":\"曲麻莱\",\"data\":[1131.7,0],\"type\":\"line\"},{\"name\":\"小灶火\",\"data\":[2666.8,0],\"type\":\"line\"},{\"name\":\"诺木洪\",\"data\":[2876.4,0],\"type\":\"line\"},{\"name\":\"清水河\",\"data\":[805.9,0],\"type\":\"line\"},{\"name\":\"西宁\",\"data\":[2767.6,0],\"type\":\"line\"},{\"name\":\"尖扎\",\"data\":[3422.2,0],\"type\":\"line\"},{\"name\":\"冷湖\",\"data\":[2497,0],\"type\":\"line\"},{\"name\":\"托勒\",\"data\":[1366.5,0],\"type\":\"line\"},{\"name\":\"达日\",\"data\":[1329,0],\"type\":\"line\"},{\"name\":\"天峻\",\"data\":[1400.1,0],\"type\":\"line\"},{\"name\":\"茶卡\",\"data\":[2120.6,0],\"type\":\"line\"},{\"name\":\"平安\",\"data\":[3214.8,0],\"type\":\"line\"}]}";
        //前端传的option数据
        // generateEChart(optiona, "D:/",JSpath);
        //后台构造的柱状图数据
        // generateEChart(testBar(true), "D:/",JSpath);
        //后台构造的折线图数据
        generateEChart(testLine(true), "D:/",JSpath);
    }

    public static String generateEChart(String options,
                                        String tmpPath,String echartJsPath) {
        String dataPath = writeFile(options,tmpPath);
        String fileName =  UUID.randomUUID().toString().substring(0, 8) + ".png";
        String path = tmpPath + fileName;
        try {
            File file = new File(path); // 文件路径（路径+文件名）
            if (!file.exists()) { // 文件不存在则创建文件，先创建目录
                File dir = new File(file.getParent());
                dir.mkdirs();
                file.createNewFile();
            }
            String cmd = "phantomjs " + echartJsPath + " -infile " + dataPath
                    + " -outfile " + path;
            Process process = Runtime.getRuntime().exec(cmd);
            BufferedReader input = new BufferedReader(new InputStreamReader(
                    process.getInputStream()));
            String line = "";
            while ((line = input.readLine()) != null) {
                System.out.println(line);
            }
            input.close();

            File jsonFile=new File(dataPath);
			/*if(jsonFile.exists()){
				jsonFile.delete();
			}*/
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            return path;
        }
    }

    public static String writeFile(String options,String tmpPath) {
        String dataPath = tmpPath
                + UUID.randomUUID().toString().substring(0, 8) + ".json";
        try {
            /* 写入Txt文件 */
            File writename = new File(dataPath); // 相对路径，如果没有则要建立一个新的output.txt文件
            if (!writename.exists()) { // 文件不存在则创建文件，先创建目录
                File dir = new File(writename.getParent());
                dir.mkdirs();
                writename.createNewFile(); // 创建新文件
            }
            BufferedWriter out = new BufferedWriter(new FileWriter(writename));
            out.write(options); // \r\n即为换行
            out.flush(); // 把缓存区内容压入文件
            out.close(); // 最后记得关闭文件
        } catch (IOException e) {
            e.printStackTrace();
        }
        return dataPath;
    }

    /**
     * 折线图
     *
     * @param isHorizontal
     *            是否水平放置
     */
    public static String testLine(boolean isHorizontal) {
        String[] types = { "邮件营销", "联盟广告", "视频广告" };
        int[][] datas = { { 120, 132, 101, 134, 90, 230, 210 },
                { 220, 182, 191, 234, 290, 330, 310 },
                { 150, 232, 201, 154, 190, 330, 410 } };
        String title = "广告数据";

        GsonOption option = new GsonOption();

        option.title().text(title).subtext("虚构").x("left");// 大标题、小标题、位置

        // 提示工具
        option.tooltip().trigger(Trigger.axis);// 在轴上触发提示数据
        // 工具栏
        option.toolbox().show(true).feature(Tool.saveAsImage);// 显示保存为图片

        option.legend(types);// 图例

        CategoryAxis category = new CategoryAxis();// 轴分类
        category.data("周一", "周二", "周三", "周四", "周五", "周六", "周日");
        category.boundaryGap(false);// 起始和结束两端空白策略

        // 循环数据
        for (int i = 0; i < types.length; i++) {
            Line line = new Line();// 三条线，三个对象
            String type = types[i];
            line.name(type).stack("总量");
            for (int j = 0; j < datas[i].length; j++)
                line.data(datas[i][j]);
            option.series(line);
        }

        if (isHorizontal) {// 横轴为类别、纵轴为值
            option.xAxis(category);// x轴
            option.yAxis(new ValueAxis());// y轴
        } else {// 横轴为值、纵轴为类别
            option.xAxis(new ValueAxis());// x轴
            option.yAxis(category);// y轴
        }

        return new Gson().toJson(option);
    }

    /**
     * 柱状图
     *
     * @param isHorizontal
     *            是否水平放置
     */
    public static String testBar(boolean isHorizontal) {
        String[] citis = { "广州", "深圳", "珠海", "汕头", "韶关", "佛山" };
        int[] datas = { 6030, 7800, 5200, 3444, 2666, 5708 };
        String[] colors = { "rgb(2,111,230)", "rgb(186,73,46)",
                "rgb(78,154,97)", "rgb(2,111,230)", "rgb(186,73,46)",
                "rgb(78,154,97)" };
        String title = "地市数据";

        GsonOption option = new GsonOption();

        option.title(title); // 标题
        // 工具栏
        option.toolbox().show(true).feature(Tool.mark, // 辅助线
                Tool.dataView, // 数据视图
                new MagicType(Magic.line, Magic.bar),// 线图、柱状图切换
                Tool.restore,// 还原
                Tool.saveAsImage);// 保存为图片

        option.tooltip().show(true).formatter("{a} <br/>{b} : {c}");// 显示工具提示,设置提示格式

        option.legend(title);// 图例

        Bar bar = new Bar(title);// 图类别(柱状图)
        CategoryAxis category = new CategoryAxis();// 轴分类
        category.data(citis);// 轴数据类别
        // 循环数据
        for (int i = 0; i < citis.length; i++) {
            int data = datas[i];
            String color = colors[i];
            // 类目对应的柱状图
            HashMap<String, Object> map = new HashMap<String, Object>(2);
            map.put("value", data);
            map.put("itemStyle",
                    new ItemStyle().normal(new Normal().color(color)));
            bar.data(map);
        }

        if (isHorizontal) {// 横轴为类别、纵轴为值
            option.xAxis(category);// x轴
            option.yAxis(new ValueAxis());// y轴
        } else {// 横轴为值、纵轴为类别
            option.xAxis(new ValueAxis());// x轴
            option.yAxis(category);// y轴
        }

        option.series(bar);
        return new Gson().toJson(option);
    }
}
