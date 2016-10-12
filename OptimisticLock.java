package concurrent;

/**
 * 乐观锁
 * 
 * 场景:有一个对象value,需要被两个线程调用,由于是共享数据,存在脏数据的问题
 * 悲观锁可以利用synchronized实现,这里不提.
 * 现在用乐观锁来解决这个脏数据问题
 * 
 * @author lxz
 *
 */
public class OptimisticLock {
    public static int value = 0; // 多线程同时调用的操作对象

    /**
     * A线程要执行的方法
     */
    public static void invoke(int Avalue, String i)
            throws InterruptedException {
        Thread.sleep(1000L);//延长执行时间
        if (Avalue != value) {//判断value版本
            System.out.println(Avalue + ":" + value + "A版本不一致,不执行");
            value--;
        } else {
            Avalue++;//对数据操作
            value = Avalue;;//对数据操作
            System.out.println(i + ":" + value);
        }
    }

    /**
     * B线程要执行的方法
     */
    public static void invoke2(int Bvalue, String i)
            throws InterruptedException {
        Thread.sleep(1000L);//延长执行时间
        if (Bvalue != value) {//判断value版本
            System.out.println(Bvalue + ":" + value + "B版本不一致,不执行");
        } else {
            System.out.println("B:利用value运算,value="+Bvalue);
        }
    }

    /**
     * 测试,期待结果:B线程执行的时候value数据总是当前最新的
     */
    public static void main(String[] args) throws InterruptedException {
        new Thread(new Runnable() {//A线程
            public void run() {
                try {
                    for (int i = 0; i < 3; i++) {
                        int Avalue = OptimisticLock.value;//A获取的value
                        OptimisticLock.invoke(Avalue, "A");
                    }

                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();
        new Thread(new Runnable() {//B线程
            public void run() {
                try {
                    for (int i = 0; i < 3; i++) {
                        int Bvalue = OptimisticLock.value;//B获取的value
                        OptimisticLock.invoke2(Bvalue, "B");
                    }
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
        }).start();
    }

}
