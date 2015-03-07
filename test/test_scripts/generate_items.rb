require 'net/http'
#Generate diff requests for items create

class Generator
  @uri = nil

  def initialize(uri = 'http://127.0.0.1:3000')
    @uri = URI.parse uri
  end

  def send_post_request(body = {})
    Net::HTTP.post_form(@uri, body)
  end

  #----------------------PRODUCTS------------------------------

  def create_product(product_name, current_status, version)
    send_post_request({'act' => 'create_product',
                       'name' => product_name.to_s,
                       'status' => current_status.to_s,
                       'version' => version.to_s})
  end

  def delete_all_products
    send_post_request({'act' => 'delete_all_products'})
  end

  #----------------------RUNS------------------------------
  def create_run_for_product(product_name, run_status, run_version)
    send_post_request({'act' => 'create_run_for_product',
                       'product_name' => product_name.to_s,
                       'run_status' => run_status.to_s,
                       'version' => run_version.to_s})
  end
end
g = Generator.new
# g.create_product('11', '11', '11')
# g.delete_all_products
g.create_run_for_product('Product', '100', '100')
