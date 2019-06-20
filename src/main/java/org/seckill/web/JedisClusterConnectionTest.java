package org.seckill.web;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;
import redis.clients.jedis.HostAndPort;
import redis.clients.jedis.JedisCluster;

import java.util.HashSet;
import java.util.Set;

/**
 * @author 张韧炼
 * @create 2019-06-11 19:46
 **/
public class JedisClusterConnectionTest {

    String json = "{\"count\":10,\"curIndex\":1,\"data\":[{\"Status\":\"最新已部署\",\"Decription\":\"计件薪资审批\",\"ModelKey\":\"VR_PIECE_SALARY\",\"ModelName\":\"计件薪资审批\",\"CreateTime\":\"2019-06-12 15:04:23\",\"ModelCategory\":\"OUTER_FORM\",\"ModelId\":\"109\",\"LastUpdateDate\":\"2019-06-12 15:06:54\"},{\"Status\":\"最新已部署\",\"Decription\":\"设计合同审批流\",\"ModelKey\":\"vr_contract_design_process\",\"ModelName\":\"设计合同审批流\",\"CreateTime\":\"2019-06-12 13:33:27\",\"ModelCategory\":\"OUTER_FORM\",\"ModelId\":\"23\",\"LastUpdateDate\":\"2019-06-12 13:38:14\"},{\"Status\":\"最新已部署\",\"Decription\":\"工程合同审批流\",\"ModelKey\":\"vr_contract_info_process\",\"ModelName\":\"工程合同审批流\",\"CreateTime\":\"2019-06-12 13:17:19\",\"ModelCategory\":\"OUTER_FORM\",\"ModelId\":\"1\",\"LastUpdateDate\":\"2019-06-12 15:08:49\"},{\"Status\":\"最新已部署\",\"Decription\":\"施工计划审批\",\"ModelKey\":\"vr_lobor_plan\",\"ModelName\":\"施工计划审批\",\"CreateTime\":\"2019-06-12 14:59:19\",\"ModelCategory\":\"OUTER_FORM\",\"ModelId\":\"102\",\"LastUpdateDate\":\"2019-06-12 15:10:04\"},{\"Status\":\"最新已部署\",\"Decription\":\"项目人工预算审批流程\",\"ModelKey\":\"vr_loborbudget\",\"ModelName\":\"项目人工预算审批流程\",\"CreateTime\":\"2019-06-12 14:41:17\",\"ModelCategory\":\"OUTER_FORM\",\"ModelId\":\"37\",\"LastUpdateDate\":\"2019-06-12 15:11:02\"},{\"Status\":\"最新已部署\",\"Decription\":\"项目人工预算变更\",\"ModelKey\":\"vr_loborbudget_change\",\"ModelName\":\"项目人工预算变更\",\"CreateTime\":\"2019-06-12 14:47:09\",\"ModelCategory\":\"OUTER_FORM\",\"ModelId\":\"48\",\"LastUpdateDate\":\"2019-06-12 15:12:00\"},{\"Status\":\"最新已部署\",\"Decription\":\"报价管理审批流程\",\"ModelKey\":\"vr_quote_version\",\"ModelName\":\"报价管理审批流程\",\"CreateTime\":\"2019-06-13 20:31:21\",\"ModelCategory\":\"OUTER_FORM\",\"ModelId\":\"2501\",\"LastUpdateDate\":\"2019-06-13 20:45:49\"},{\"Status\":\"最新已部署\",\"Decription\":\"工程变更审批流\",\"ModelKey\":\"vr_visa_instruction_process\",\"ModelName\":\"工程变更审批流\",\"CreateTime\":\"2019-06-12 13:26:44\",\"ModelCategory\":\"OUTER_FORM\",\"ModelId\":\"12\",\"LastUpdateDate\":\"2019-06-12 13:32:07\"}],\"firstIndex\":1,\"lastIndex\":2,\"nextIndex\":2,\"pageSize\":8,\"pagesCount\":2,\"preIndex\":1}";

    public static void main(String[] args) {





        /*GenericObjectPoolConfig gopc = new GenericObjectPoolConfig();
        gopc.setMaxTotal(32);
        gopc.setMaxIdle(4);
        gopc.setMaxWaitMillis(6000);

        Set<HostAndPort> haps =new HashSet();
        HostAndPort h1 = new HostAndPort("192.168.175.35", 5000);
        HostAndPort h2 = new HostAndPort("192.168.175.36", 5004);
        HostAndPort h3 = new HostAndPort("192.168.175.35", 5001);
        HostAndPort h4 = new HostAndPort("192.168.175.35", 5002);
        HostAndPort h5 = new HostAndPort("192.168.175.36", 5005);
        HostAndPort h6 = new HostAndPort("192.168.175.36", 5003);
        haps.add(h1);
        haps.add(h2);
        haps.add(h3);
        haps.add(h4);
        haps.add(h5);
        haps.add(h6);
        String password = "Md1234";
        JedisCluster jedisCluster = new JedisCluster(haps, 2000, 2000, 3, password,gopc);
        System.out.println("jedisCluster=" + jedisCluster);*/
    }
}
