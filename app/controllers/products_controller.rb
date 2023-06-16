class ProductsController <  ApplicationController
  before_action :fetch_product, only: [:show, :update, :edit, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end
  
  def edit
    @product = Product.find(params[:id])
  end

  def update
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end
  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :quantity, :description, :category_id )
  end

  def fetch_product
    @product = Product.find(params[:id])
  end
end