package cn.itcast.shop.cart.action;
import org.apache.struts2.ServletActionContext;
//Struts2 的一个核心工具类，
// 通过它我们可以方便地获取到与当前请求相关的原生 Servlet API 对象，比如 Request、Response 和 Session。
import cn.itcast.shop.cart.vo.Cart;
import cn.itcast.shop.cart.vo.CartItem;
import cn.itcast.shop.product.service.ProductService;
//ProductService 是商品服务层，负责处理商品信息。
//它通过调用 ProductDao 来获取商品信息，并提供给 CartAction 使用。
import cn.itcast.shop.product.vo.Product;
import com.opensymphony.xwork2.ActionSupport;
//ActionSupport 是 Struts2 框架提供的一个基类，它实现了 Action 接口，并提供了一些常用的方法。
// 它是一个抽象类，所以不能直接实例化，但可以继承它来实现自己的 Action 类。
// 它提供了一些常用的方法，比如 getRequest()、getResponse()、getSession() 等，
// 这些方法可以帮助我们方便地获取到与当前请求相关的原生 Servlet API 对象。

/**
 * 购物车Action购物车控制器，负责接受并处理请求：
 * 它的核心职责是：
接收用户请求: 当用户在网页上点击“加入购物车”、“删除商品”或“查看购物车”等按钮时，CartAction 负责接收这些从浏览器发来的指令。
参数接收: 它会自动获取指令中附带的重要信息，比如要操作的“商品ID (pid)”和“数量 (count)”。
调用服务: 它不会自己去操作数据库，而是调用“服务层”(ProductService)来获取商品信息。
管理购物车: 它负责从用户的 Session（会话）中取出专属的 Cart 对象，并调用 Cart 对象自身的方法（如 addCart, removeCart）来完成最终的操作。
返回结果: 操作完成后，它会告诉 Struts2 框架下一步该做什么，通常是跳转到一个新的页面（比如购物车列表页）来向用户展示操作结果。
 * 
 * 
 */
public class CartAction extends ActionSupport {
	// 接收pid（商品id）
	private Integer pid;
/*这是用来接收请求参数的两个属性。当用户点击“加入购物车”时，通常会发起一个类似 
.../addCart.action?pid=123&count=2 这样的请求。Struts2 框架会自动识别到 URL 中的 pid 和 count 参数，
并调用下面对应的 setPid() 和 setCount() 方法，将值 123 和 2 赋给这两个属性。
*/

	// 接收数量count（购买数量）
	private Integer count;
	// 注入商品的Service（商品的Service）
	private ProductService productService;
	/*这是一个用来接收依赖注入的属性。本项目使用了 Spring 框架来管理对象。
当 CartAction 被创建时，Spring 容器会自动将一个已经创建好的 ProductService 实例“注入”到这个属性中。
这样，CartAction 就可以直接使用 productService 的方法，而无需自己去 new 一个实例，这大大降低了类之间的耦合度*/
    
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	// 将购物项添加到购物车:执行的方法
	public String addCart() {
		// 封装一个CartItem对象.（购物项）
		CartItem cartItem = new CartItem();
		// 设置数量:从请求中接受到的count值即把用户想买的数量设置进去
		cartItem.setCount(count);
		// //通过注入的productService，根据请求中接受到的pid从数据库中找到这个商品的完整信息
		Product product = productService.findByPid(pid);
		// 设置商品:
		cartItem.setProduct(product);
		// 将该商品添加到购物车的购物项中.

		// getCart（）会去Session中找到当前用户专属的购物车，如果找到就说明用户已经添加过别的商品，可以直接拿来用，
		// 没找到就说明用户第一次添加商品，就new一个全新的cart对象，存到session中，并返回这个新的购物车，
		// 即确保每个用户都有一个独立的购物车
		Cart cart = getCart();
		cart.addCart(cartItem);
		//用户拿到购物车cart对象后，调用Cart对象自身的addCart方法，把刚刚创建的cartItem购物项放进去
		return "addCart";
		//最后，方法返回一个结果字符串 "addCart"。
		// Struts2 框架会根据这个结果，让用户跳转到购物车页面，展示刚刚添加成功的结果
		//Struts2 框架会捕获这个字符串，
		// 并在 struts.xml 配置文件中查找与之匹配的规则，然后将用户重定向或转发到指定的页面（通常是 cart.jsp
	}

	// 清空购物车的执行的方法:
	public String clearCart(){
		// 获得购物车对象.
		Cart cart = getCart();
		// 调用购物车中清空方法.
		cart.clearCart();
		return "clearCart";
	}
	
	// 从购物车中移除购物项的方法:
	public String removeCart(){
		// 获得购物车对象
		Cart cart = getCart();
		// 调用购物车中移除的方法:
		cart.removeCart(pid);
		// 返回页面:
		return "removeCart";
	}
	
	// 我的购物车:执行的方法
	public String myCart(){
		return "myCart";
		//Struts2 会根据配置跳转到购物车列表页
	}
	
	/**
	 * 获得购物车的方法:从session中获得购物车.
	 * @return
	 */
	private Cart getCart() {
		Cart cart = (Cart) ServletActionContext.getRequest().getSession()
				.getAttribute("cart");
				/*
				ServletActionContext.getRequest(): 获取当前用户的 Request 对象。
.getSession(): 通过 Request 对象获取到用户的 Session 会话对象。
.getAttribute("cart"): 尝试从 Session 中取出一个名为 "cart" 的属性。 */
		if (cart == null) {
			cart = new Cart();
			ServletActionContext.getRequest().getSession()
					.setAttribute("cart", cart);
					//如果cart为空，则创建一个全新的Cart对象，并将其设置为Session中的cart属性
		}
		return cart;
	}
}
/*依赖注入 (Dependency Injection, DI) 是一种设计模式，它的核心思想是：一个对象 (CartAction) 不应该自己去创建它所依赖的
另一个对象 (ProductService)，而应该由一个第三方容器 (如 Spring) 来创建这个依赖，并“注入”给它。
这种模式也常被称为 控制反转 (Inversion of Control, IoC)，因为创建对象的控制权从您自己的代码反转给了外部容器。
Session 就是服务器为每一个用户（浏览器）创建的一个“专属储物柜”（一块内存空间），用来存放该用户在一段时间内的私有数据，
以弥补HTTP协议无状态的缺陷。它通过一个独一无二的 Session ID (通常存在 Cookie 中) 来进行识别。
*/