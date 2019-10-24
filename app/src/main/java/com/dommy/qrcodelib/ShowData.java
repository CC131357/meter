package com.dommy.qrcodelib;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.ArrayAdapter;
import android.widget.BaseAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.TextView;
import android.widget.Toast;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;




public class ShowData extends Activity implements AdapterView.OnItemSelectedListener {
    private ListView listView;
    ArrayList<Meter> meterlist;
    Meter meter;
    String name = null;

    private Spinner spinner;
    private TextView textView;
    private ArrayAdapter<String> arr_adapter;

    List<String> list = new ArrayList<>();//添加下拉元素
    @SuppressLint("HandlerLeak")


    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity);

        final Button select = findViewById(R.id.select);
        listView = findViewById(R.id.list_view);

        //下拉菜单相关控件实例化
        spinner = findViewById(R.id.Spinner_city);
        textView = findViewById(R.id.TextView_city);

        list.add("内层1#");
        list.add("内层2#");
        list.add("AOI 1#");
        list.add("AOI 2#");
        list.add("磨边线");
        list.add("1#压合");
        list.add("生化锅炉");
        list.add("B2压合");
        list.add("B2柴油锅炉");
        list.add("新压机");
        list.add("新棕化空调");
        list.add("吸尘");
        list.add("钻孔照明");
        list.add("钻机");
        list.add("钻机大门");

        arr_adapter = new ArrayAdapter<>(this,android.R.layout.simple_spinner_item,list);
        arr_adapter.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item);
        spinner.setAdapter(arr_adapter);
        spinner.setOnItemSelectedListener(this);

        Button back = findViewById(R.id.exit);
        back.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                Intent intent = new Intent(ShowData.this,MainActivity.class);
                startActivity(intent);
                finish();
            }
        });

        new Thread(new Runnable() {
            @Override
            public void run() {
                Connection con=null;
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

                    String sql="select * from(select meter_info.meter_id,department_info.dept_name,meter_info.location,reading.record_time,reading.record\n" +
                            "from department_info join meter_info  \n" +
                            "on department_info.dept_id=meter_info.dept_id \n" +
                            "join reading\n" +
                            "on meter_info.meter_id = reading.meter_id\n" +
                            "where datediff(month,record_time,getdate())=0 ) t where location = '"+name+"';";
                    Statement st=(Statement)con.createStatement();
                    ResultSet rs=st.executeQuery(sql);
                    meterlist = new ArrayList<>();
                    while(rs.next()){
                        meter = new Meter();
                        meter.id = rs.getString("meter_id");
                        meter.location = rs.getString("location");
                        meter.time = rs.getString("record_time");
                        meter.record = rs.getString("record");
                        //System.out.println(meter.id  +  meter.location  +  meter.time  +  meter.record);
                        meterlist.add(meter);//添加到数组中


                    }


                    select.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            runOnUiThread(new Runnable() {
                                @Override
                                public void run() {

                                    listView.setAdapter(new BaseAdapter() {
                                        @Override
                                        public int getCount() {
                                            return meterlist.size();
                                        }

                                        @Override
                                        public Object getItem(int position) {
                                            return meterlist.get(position);
                                        }

                                        @Override
                                        public long getItemId(int position) {
                                            return position;
                                        }

                                        //getView()给每一行设置条目
                                        @Override
                                        public View getView(int position, View convertView, ViewGroup viewGroup) {
                                            View view;
                                            if(convertView == null){
                                                view = View.inflate(getBaseContext(),R.layout.itemlayout,null);
                                            }else {
                                                view = convertView;
                                            }
                                            Meter meter = meterlist.get(position);
                                            TextView id = view.findViewById(R.id.stu_number);
                                            TextView location = view.findViewById(R.id.stu_name);
                                            TextView time = view.findViewById(R.id.stu_age);
                                            TextView record = view.findViewById(R.id.stu_rec);
                                            id.setTextSize(18);
                                            location.setTextSize(18);
                                            time.setTextSize(18);
                                            record.setTextSize(18);
                                            id.setText(meter.getId());
                                            location.setText(meter.getLocation());
                                            time.setText(meter.getTime());
                                            record.setText(meter.getRecord());
                                            return view;
                                        }

                                    });
                                }
                            });
                        }
                    });

                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

    @Override
    public void onItemSelected(AdapterView<?> adapterView, View view, int i, long id) {
        name = arr_adapter.getItem(i);
        textView.setText("选择的是："+name);
    }

    @Override
    public void onNothingSelected(AdapterView<?> parent) {

    }

    /*
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
            try{
                String sql="select * from(select meter_info.meter_id,meter_info.location,reading.record_time,reading.record\n" +
                        "from department_info join meter_info  \n" +
                        "on department_info.dept_id=meter_info.dept_id \n" +
                        "join reading\n" +
                        "on meter_info.meter_id = reading.meter_id\n" +
                        "where datediff(month,record_time,getdate())=0 ) t where meter_id = 1001;";
                Statement st=(Statement)con1.createStatement();
                ResultSet rs=st.executeQuery(sql);
                while(rs.next()){
                    String id = rs.getString("meter_id");
                    String location = rs.getString("location");
                    String time = rs.getString("record_time");
                    String record = rs.getString("record");
                    meter_info mt = new meter_info(id,location,time,record);
                    meter_infoArraylist.add(mt);
                }
                lv = (ListView)findViewById(R.id.student_lv);
                lv.setAdapter(new BaseAdapter() {
                    @Override
                    public int getCount() {
                        return meter_infoArraylist.size();
                    }

                    @Override
                    public Object getItem(int position) {
                        return null;
                    }

                    @Override
                    public long getItemId(int position) {
                        return 0;
                    }

                    @Override
                    public View getView(int position, View convertView, ViewGroup parent) {
                        View view;
                        if(convertView == null){
                            view = View.inflate(getBaseContext(),R.layout.itemlayout,null);
                        }else {
                            view = convertView;
                        }
                        meter_info mt = meter_infoArraylist.get(position);
                        TextView id = (TextView)findViewById(R.id.stu_number);
                        TextView location = (TextView)findViewById(R.id.stu_name);
                        TextView time = (TextView)findViewById(R.id.stu_age);
                        TextView record = (TextView)findViewById(R.id.stu_rec);
                        id.setText(mt.getId());
                        location.setText(mt.getLocation());
                        time.setText(mt.getTime());
                        record.setText(mt.getRecord());
                        return view;
                    }
                });

            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    };
    */
}

