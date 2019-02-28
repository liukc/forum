package sqlbackup;

import org.apache.commons.io.IOUtils;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Backup {
    /**
     * 执行生成备份
     */
    public void doBackup(){
        System.out.println("现在时间是"+new Date());
        Runtime runtime = Runtime.getRuntime();  //获取Runtime实例
        String database1 = "forum"; // 需要备份的数据库名
        Date currentDate = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
        String sdfDate = sdf.format(currentDate);
        String filepath = "d:\\time_" + sdfDate + ".sql"; // 备份的路径地址
        //执行命令
        String stmt = "mysqldump -h localhost -uroot -p123456 --databases "+database1+" > "+filepath;
        System.out.println(stmt);
        try {
            String[] command = { "cmd", "/c", stmt};
            Process process = runtime.exec(command);

            InputStream input = process.getInputStream();
            System.out.println(IOUtils.toString(input, "UTF-8"));

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void restore() {
        String user = "root";
        String password = "123456";
        String database = "forum"; // 需要还原的数据库名
        System.out.println("现在时间是" + new Date());
        Runtime runtime = Runtime.getRuntime();

        String cmd = "mysql  -h localhost" + " -u " + user + " -p" + password + " " + database;
        System.out.println(cmd);
        try {
            String filePath =  "D:\\time_2019-02-25_20-12-19.sql"; // sql文件路径
            String stmt = cmd + " < " + filePath;
            String[] command = {"cmd", "/c", stmt};
            Process process = runtime.exec(command);
            //若有错误信息则输出
            InputStream errorStream = process.getErrorStream();
            System.out.println(IOUtils.toString(errorStream, "utf-8"));
            //等待操作
            int processComplete = process.waitFor();
            if (processComplete == 0) {
                System.out.println("还原成功.");
            } else {
                throw new RuntimeException("还原数据库失败.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
