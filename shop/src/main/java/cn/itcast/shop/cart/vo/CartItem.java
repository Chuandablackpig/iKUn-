package cn.itcast.shop.cart.vo;

import cn.itcast.shop.product.vo.Product;

/**
 * 购物项对象：描述什么商品，买了几件，两个核心属性：product、count数量
 *
 */
public class CartItem {
	private Product product;	// 购物项中商品信息
	private int count;			// 购买某种商品数量
	private double subtotal;	// 购买某种商品小计金额
	public Product getProduct() {
		return product;
	}
	/*公开的“设置商品”方法，它接收一个外部传来的 Product 对象，并把它“装入”到当前这个 CartItem 对象的 product 属性里*/
	public void setProduct(Product product) {
		this.product = product;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	// 小计自动计算的.
	public double getSubtotal() {
		return count * product.getShop_price();//商品单价*数量
		//当用户在购物车页面修改了购买数量（比如从2件改成3件），我们只需要更新 count 的值即可。小计金额会自动、正确地重新计算
	}
}
