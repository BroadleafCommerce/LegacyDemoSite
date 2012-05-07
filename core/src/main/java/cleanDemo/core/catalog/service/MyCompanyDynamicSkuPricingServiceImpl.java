package cleanDemo.core.catalog.service;

import org.broadleafcommerce.common.money.Money;
import org.broadleafcommerce.core.catalog.domain.Sku;
import org.broadleafcommerce.core.catalog.service.dynamic.DynamicSkuPrices;
import org.broadleafcommerce.core.catalog.service.dynamic.DynamicSkuPricingService;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service("myCompanyDynamicSkuPricingService")
public class MyCompanyDynamicSkuPricingServiceImpl implements DynamicSkuPricingService {

	@Override
	public DynamicSkuPrices getSkuPrices(Sku sku, @SuppressWarnings("rawtypes") HashMap skuPricingConsiderations) {
		DynamicSkuPrices prices = new DynamicSkuPrices();
		prices.setRetailPrice(new Money(Math.random() * 100D));
		prices.setSalePrice(new Money(1D));
		
		return prices;
	}

}
