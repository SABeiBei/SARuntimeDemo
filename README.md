# SARuntimeDemo
利用Runtime机制来替换iOS原生类的set方法

开发过程中，我们发现NSDateFormatter初始化很耗费资源，由于很多地方使用了NSDateFormatter类，因此把它做成单例来调用。
然而，当多线程set其属性setDateFormat时，有概率发生crash。

于是，想到重写setDateFormat方法，在方法里面对dateFormat属性加锁，在NSDateFormatter的扩展类中重写以下方法：

	-(void)setDateFormat:(NSString *)dateFormat {
    
	 	@synchronized(self.dateFormat) {
        
        	self.dateFormat = dateFormat;
    	}
	}

但是，这里有一个问题，在set方法中使用self.dateFormat会导致该方法无限循环，同时，类的扩展中并不能访问到_dateFormat属性，
只能通过self.dateFormat来访问。

我的解决方案是：
在self.dateFormat = dateFormat;语句前通过Runtime将set方法替换成其他方法，这样在执行self.dateFormat赋值的时候，就不再循环了。
具体请看代码。

