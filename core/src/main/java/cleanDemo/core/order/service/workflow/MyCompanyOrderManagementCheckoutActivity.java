package cleanDemo.core.order.service.workflow;

import org.broadleafcommerce.core.checkout.service.workflow.CheckoutContext;
import org.broadleafcommerce.core.checkout.service.workflow.CheckoutSeed;
import org.broadleafcommerce.core.workflow.BaseActivity;
import org.broadleafcommerce.core.workflow.ProcessContext;

public class MyCompanyOrderManagementCheckoutActivity extends BaseActivity {
	
	@Override
	public ProcessContext execute(ProcessContext context) throws Exception {
        CheckoutSeed seed = ((CheckoutContext) context).getSeedData();
        
        /*
		 * TODO do some logic to submit this order to the external OMS
		 */
		System.out.println(seed.getOrder().getOrderNumber());
		
        return context;
    }

}
