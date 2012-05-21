package cleanDemo.core.catalog.domain;

import org.broadleafcommerce.core.catalog.domain.ProductSku;
import org.broadleafcommerce.core.store.domain.ZipCode;

import java.util.List;

public interface SampleProduct extends ProductSku {

	public Boolean isRestricted();

	public void setRestricted(Boolean restricted);

	public List<ShippingCountry> getShippingCountries();

	public void setShippingCountries(List<ShippingCountry> shippingCountries);

    public ZipCode getZipCode();

    public void setZipCode(ZipCode zipCode);
	
}