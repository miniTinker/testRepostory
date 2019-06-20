package org.seckill.exception;

/**
 * 重复秒杀异常（运行期异常）
 *
 * @author 张韧炼
 * @create 2019-05-30 15:39
 **/
public class RepeatKillException extends SeckillException{

    public RepeatKillException(String message) {
        super(message);
    }

    public RepeatKillException(String message, Throwable cause) {
        super(message, cause);
    }
}
