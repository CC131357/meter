package com.dommy.qrcodelib;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.database.Cursor;
import android.os.Bundle;
import android.os.Looper;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.Year;
import java.util.Calendar;
import java.util.Date;


public class ZxingActivity extends Activity {
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.info);
        new Thread(runnable).start();
        Button back = (Button) findViewById(R.id.back_to_list_id);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                new Thread(new Runnable() {
                    @Override
                    public void run() {
                        EditText save_info = (EditText) findViewById(R.id.record_info);
                        String str1 =save_info.getText().toString();
                        Connection con=null;
                        String scanResult = getIntent().getStringExtra("");
                        Date date=new Date();//获取时间
                        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//设置时间格式
                        String strs=sdf.format(date);//格式化
                        try {
                            Class.forName("net.sourceforge.jtds.jdbc.Driver");
                            System.out.println("数据库驱动加载成功！");
                            con= DriverManager.getConnection("jdbc:jtds:sqlserver://10.0.2.2:1433/Meter","CC131357","131357");
                            if(!con.isClosed()) {
                                System.out.println("数据库连接成功!!");
                            }

                        } catch (ClassNotFoundException e) {
                            e.printStackTrace();
                            System.out.println("数据库驱动没有安装");
                        } catch (SQLException e) {
                            e.printStackTrace();
                            System.out.println("数据库连接失败");
                        }
                        try {

                                String sql = "insert into reading(meter_id,record_time,record,remask) values (" + scanResult + ",'" + strs + "'," + str1 + ",'无')";
                                PreparedStatement psmt = con.prepareStatement(sql);
                                psmt.executeUpdate();
                                Looper.prepare();
                                Toast.makeText(ZxingActivity.this, "保存成功", Toast.LENGTH_LONG).show();
                                psmt.close();
                            Looper.loop();
                            con.close();


                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                }).start();
            }
        });
    }

    Runnable runnable=new Runnable()  {
        private Connection con = null;
        @Override
        public void run() {
            try {
                Class.forName("net.sourceforge.jtds.jdbc.Driver");
                System.out.println("数据库驱动加载成功！");
                con= DriverManager.getConnection("jdbc:jtds:sqlserver://10.0.2.2:1433/Meter","CC131357","131357");
                if(!con.isClosed()) {
                    System.out.println("数据库连接成功!!");
                }

            } catch (ClassNotFoundException e) {
                e.printStackTrace();
                System.out.println("数据库驱动没有安装");
            } catch (SQLException e) {
                e.printStackTrace();
                System.out.println("数据库连接失败");
            }
            testConnection(con);
        }

        private void testConnection(Connection con1)   {
            TextView meter_id = findViewById(R.id.tv_info_id);
            TextView department_name = findViewById(R.id.tv_info_name);
            TextView location_info  = findViewById(R.id.tv_info_age);
            TextView remask_info = findViewById(R.id.tv_info_sex);
            TextView before_time = findViewById(R.id.tv_info_likes);
            TextView before_record = findViewById(R.id.tv_info_phone);
            TextView now_time = findViewById(R.id.tv_info_train_date);
            Cursor cursor = null;

            try{
                String scanResult = getIntent().getStringExtra("");
                String sql="select * from(select meter_info.meter_id,department_info.dept_name,meter_info.location,reading.record_time,reading.record,reading.remask\n" +
                        "from department_info join meter_info  \n" +
                        "on department_info.dept_id=meter_info.dept_id \n" +
                        "join reading\n" +
                        "on meter_info.meter_id = reading.meter_id\n" +
                        "where datediff(day,cast(record_time as datetime),getdate()) =1 ) t where meter_id = "+scanResult+"";
                Statement st=(Statement)con1.createStatement();
                ResultSet rs=st.executeQuery(sql);
                while(rs.next()){
                    Date date=new Date();//获取时间
                    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//设置时间格式
                    String strs=sdf.format(date);//格式化
                    meter_id.setText(rs.getString("meter_id").toString());
                    department_name.setText(rs.getString("dept_name").toString());
                    location_info.setText(rs.getString("location").toString());
                    remask_info.setText(rs.getString("remask").toString());
                    before_time.setText(rs.getString("record_time").toString());
                    before_record.setText(rs.getString("record"));
                    now_time.setText(strs);
                }

            } catch (SQLException e) {
                e.printStackTrace();
            }

      /*      Button back = (Button) findViewById(R.id.back_to_list_id);
            back.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View v) {
                    EditText save_info = (EditText) findViewById(R.id.record_info);
                    String str1 =save_info.getText().toString();
                    Connection con=null;
                    String scanResult = getIntent().getStringExtra("");
                    Date date=new Date();//获取时间
                    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");//设置时间格式
                    String strs=sdf.format(date);//格式化
                    try {

                        String sql = "insert into reading(meter_id,record_time,record,remask) values ("+scanResult+",'"+strs+"',"+str1+",'无')";
                        Statement st=(Statement)con.createStatement();
                        ResultSet rs=st.executeQuery(sql);

                        con.close();
                        rs.close();
                        st.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }

                }
            });*/
        }
    };

}
