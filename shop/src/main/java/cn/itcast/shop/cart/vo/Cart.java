package cn.itcast.shop.cart.vo;
import java.io.Serializable;
/*我这个类的对象是可以被序列化的”。序列化可以被通俗地理解为将一个内存中的对象“拍平”成一串字节数据，
这样就可以把它存到硬盘上或者通过网络传输。在这里，它的主要作用是允许 Cart 对象被存放在 Session 中。
因为 Session 可能会在服务器重启或分布式部署时被钝化（保存到磁盘），所以存入 Session 的对象必须是可序列化的。*/
import java.util.Collection;
/*一个集合的顶层接口，List、Set 都继承自它。这里用它来作为一个通用的类型 */
import java.util.LinkedHashMap;
import java.util.Map;
/*Map 接口的实现类，它是一个有序的 Map，即元素的插入顺序会保留。
这里用它来存储购物车中的商品，因为购物车中的商品顺序很重要，
比如用户先添加了 A 商品，再添加 B 商品，那么 B 商品应该排在 A 商品后面。*/

/**
 * 购物车对象
 */
public class Cart implements Serializable{
	// 购物车属性
	// 购物项集合:Map的key就是商品pid,value:购物项cartItem：可以快速判断一个一个商品是否在购物车中
	//如果用list则每次判断都要遍历一下整个列表，如果用map则只需一次containKey（pid）就知道结果
	private Map<Integer, CartItem> map = new LinkedHashMap<Integer, CartItem>();
    //定义了map结构：Key 是 Integer 类型，存放的是商品的唯一ID (pid)。
    //Value 是 CartItem 类型，存放的是完整的购物项对象。
	public Collection<CartItem> getCartItems(){
		return map.values();
	//map.values() 返回的是一个 Collection 类型，它是一个购物项的集合。
    //Collection 是 Java 集合框架中的一个接口，它表示一组对象的集合。
    //Collection 接口的实现类有 List、Set 等。
    //这里用 Collection 类型来表示购物项的集合，是因为 Collection 接口提供了一个统一的方式来处理不同类型的集合。
    //比如，如果用 List 类型来表示购物项的集合，那么就不能用 Set 类型来表示购物项的集合。
    //因为 List 和 Set 是两个不同的接口，它们之间没有继承关系。
	}
	
	// 购物总计:
	private double total;

	public double getTotal() {
		return total;
	}

	// 购物车的功能:
	// 1.将购物项添加到购物车
	public void addCart(CartItem cartItem) {
		// 判断购物车中是否已经存在该购物项:
		/*
		 *  * 如果存在:
		 *  	* 数量增加
		 *  	* 总计 = 总计 + 购物项小计
		 *  * 如果不存在:
		 *  	* 向map中添加购物项
		 *  	* 总计 = 总计 + 购物项小计
		 */
		// 获得购物项中的商品的商品id.
		Integer pid = cartItem.getProduct().getPid();
		// 判断购物车中是否已经存在该购物项:
		if(map.containsKey(pid)){
			//检查这个 pid 是否已经作为 key 存在于 map 中
			// 存在：说明购物车里已经有这个商品
			CartItem _cartItem = map.get(pid);// 取出购物车中已存在的购物项
			_cartItem.setCount(_cartItem.getCount()+cartItem.getCount());
		}else{
			// 不存在
			map.put(pid, cartItem);//将新的商品pid和购物项作为key-value对存入map
		}
		// 设置总计的值：把当前购物项的金额加上
		total += cartItem.getSubtotal();

	}

	// 2.从购物车移除购物项
	public void removeCart(Integer pid) {
		// 根据商品id从map中移除对应的购物项：根据 pid 找到并移除对应的条目，同时返回被移除的那个 CartItem 对象
		CartItem cartItem = map.remove(pid);
		// 总计 = 总计 -移除的购物项小计:
		total -= cartItem.getSubtotal();
	}

	// 3.清空购物车
	public void clearCart() {
		// 将所有购物项清空
		map.clear();
		// 将总计设置为0
		total = 0;
	}
}
