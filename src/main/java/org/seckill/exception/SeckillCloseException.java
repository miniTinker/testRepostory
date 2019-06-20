package org.seckill.exception;

/**
 * 秒杀关闭异常
 *
 * @author 张韧炼
 * @create 2019-05-30 15:41
 **/
public class SeckillCloseException extends SeckillException {

    public SeckillCloseException(String message) {
        super(message);
    }

    public SeckillCloseException(String message, Throwable cause) {
        super(message, cause);
    }
}
