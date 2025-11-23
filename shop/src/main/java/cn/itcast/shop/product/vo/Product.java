// 定义了这个文件所在的包（路径），表明它属于商品(product)模块的值对象(vo)
package cn.itcast.shop.product.vo;

// 导入了 Date 类，用于处理日期时间
import java.util.Date;
// 导入了二级分类的实体类。这非常重要，它建立了商品与二级分类之间的关联
import cn.itcast.shop.categorysecond.vo.CategorySecond;

/**
 * 商品的实体对象 (Product Entity / Value Object)
 * <p>
 * 这个类是商品在程序世界中的数字身份，定义了一件商品所应具备的所有属性信息。
 * 它作为数据的载体，在数据库、后端业务逻辑和前端页面之间传递商品数据。
 * 它的结构与数据库中的 `product` 表一一对应。
 */
public class Product {
	/**
	 * 商品的唯一ID (主键)
	 */
	private Integer pid;

	/**
	 * 商品名称
	 */
	private String pname;

	/**
	 * 市场价 (用于页面展示，通常是划线价)
	 */
	private Double market_price;

	/**
	 * 本店价格 (商品的实际销售价格)
	 */
	private Double shop_price;

	/**
	 * 商品图片的存储路径
	 */
	private String image;

	/**
	 * 商品的详细描述
	 */
	private String pdesc;

	/**
	 * 是否为热门商品 (1:是, 0:否)
	 */
	private Integer is_hot;

	/**
	 * 商品上架的日期
	 */
	private Date pdate;

	/**
	 * 商品所属的二级分类对象。
	 * <p>
	 * 这是一个关键的面向对象设计，体现了ORM(对象关系映射)的思想。
	 * 它没有直接使用二级分类的ID(csid)作为属性，而是直接引用了 CategorySecond 对象。
	 * 这使得我们可以通过 product.getCategorySecond().getCsname() 这样的方式方便地获取关联数据，
	 * 而底层的数据库关联查询则由Hibernate框架自动完成。
	 */
	private CategorySecond categorySecond;

	// ================= 以下是所有属性的标准 getter 和 setter 方法 =================
	// 这些公共方法是Java Bean规范的一部分，用于从外部安全地读取和修改私有属性的值。
	// Struts2、Spring、Hibernate等框架都会通过这些方法来操作对象数据。

	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Double getMarket_price() {
		return market_price;
	}
	public void setMarket_price(Double market_price) {
		this.market_price = market_price;
	}
	public Double getShop_price() {
		return shop_price;
	}
	public void setShop_price(Double shop_price) {
		this.shop_price = shop_price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public Integer getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(Integer is_hot) {
		this.is_hot = is_hot;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public CategorySecond getCategorySecond() {
		return categorySecond;
	}
	public void setCategorySecond(CategorySecond categorySecond) {
		this.categorySecond = categorySecond;
	}
	
}
