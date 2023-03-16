//SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.2 <0.9.0;

contract SimpleStorage {
    //uint storedData;
    struct QoSs{
        uint[10] ResponseTime; //Time taken to send a request and receive a response(ms)
        uint[10] Availability; //Number of successful invocations/total invocations(%)
        uint[10] Throughput; //Total Number of invocations for a given period of time(invokes/second)
        uint[10] Successability; //Number of response / number of request messages(%)
        uint[10] Reliability; //Ratio of the number of error messages to total messages(%)
        //uint[10] Compliance; //The extent to which a WSDL document follows WSDL specification(%)
        //uint[10] BestPractices; //The extent to which a Web service follows WS-I Basic Profile(%)
        uint[10] Latency; //Time taken for the server to process a given request(ms)
        //uint[10] Documentation; //Measure of documentation (i.e. description tags) in WSDL(%)
        string[10] ServiceName;
        //补全QoS参数
    }
    QoSs mq;
    //基本的set方法
    function set(uint R/*,uint A,uint T*/,uint mindex) public {
        mq.ResponseTime[mindex] = R;
        //mq.Availability[mindex] = A;
        //mq.Throughput[mindex] = T;
    }
    //一个用户的更新方法
    //function AddOneJudge(uint mindex,) public{
        
    //}
    //一个节点群的自发更新方法

    //基本的get方法
    function get(uint index) public view returns (uint,uint,uint) {
        return (mq.ResponseTime[index],mq.Availability[index],mq.Throughput[index]);
    }

    function getbestnode(uint ResponseTime_min, uint ResponseTime_max) public view returns (uint,uint){//区间参数传递
        uint bestfit=0;
        uint subbestfit=0;
        //推荐方法
        for(uint i=0;i<mq.ResponseTime.length;i++){
            if(mq.ResponseTime[i]<=ResponseTime_max && mq.ResponseTime[i]>=ResponseTime_min){
                if(mq.ResponseTime[i]<mq.ResponseTime[bestfit]){
                    subbestfit=bestfit;
                    bestfit=i;
                }else{
                    if(mq.ResponseTime[i]<mq.ResponseTime[subbestfit]){
                        subbestfit=i;
                    }
                }
            }
        }
        return (bestfit,subbestfit);
    }
}

