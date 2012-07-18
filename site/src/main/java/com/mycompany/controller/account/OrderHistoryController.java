package com.mycompany.controller.account;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.broadleafcommerce.common.money.Money;
import org.broadleafcommerce.core.order.domain.FulfillmentGroup;
import org.broadleafcommerce.core.order.domain.FulfillmentGroupImpl;
import org.broadleafcommerce.core.order.domain.Order;
import org.broadleafcommerce.core.order.domain.OrderImpl;
import org.broadleafcommerce.core.order.domain.OrderItem;
import org.broadleafcommerce.core.order.domain.OrderItemImpl;
import org.broadleafcommerce.core.order.service.type.OrderStatus;
import org.broadleafcommerce.core.payment.domain.PaymentInfo;
import org.broadleafcommerce.core.payment.domain.PaymentInfoImpl;
import org.broadleafcommerce.core.payment.service.type.PaymentInfoType;
import org.broadleafcommerce.core.web.controller.account.BroadleafOrderHistoryController;
import org.broadleafcommerce.profile.core.domain.Address;
import org.broadleafcommerce.profile.core.domain.AddressImpl;
import org.broadleafcommerce.profile.core.service.CountryService;
import org.broadleafcommerce.profile.core.service.StateService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/account/orders")
public class OrderHistoryController extends BroadleafOrderHistoryController {

    @Resource(name = "blStateService")
    StateService stateService;

    @Resource(name = "blCountryService")
    CountryService countryService;

	@RequestMapping(method = RequestMethod.GET)
    public String viewOrderHistory(HttpServletRequest request, Model model) {
        return super.viewOrderHistory(request, model); 
    }

	@RequestMapping(value = "/{orderNumber}", method = RequestMethod.GET)
    public String viewOrderDetails(HttpServletRequest request, Model model, @PathVariable("orderNumber") String orderNumber) {
        return super.viewOrderDetails(request, model, orderNumber);
    }




    private List<Order> buildOrders(int numOrders) {

        List<Order> orders = new ArrayList<Order>();

        Order order = new OrderImpl();

        FulfillmentGroup fulfillmentGroup = new FulfillmentGroupImpl();

        Address address = new AddressImpl();
        address.setFirstName("Biff");
        address.setLastName("Tannen");
        address.setAddressLine1("123 Main St.");
        address.setCity("Austin");
        address.setState(stateService.findStateByAbbreviation("TX"));
        address.setCountry(countryService.findCountryByAbbreviation("USA"));
        address.setPostalCode("78757");
        fulfillmentGroup.setAddress(address);

        PaymentInfo paymentInfo = new PaymentInfoImpl();
        paymentInfo.setType(PaymentInfoType.CREDIT_CARD);
        paymentInfo.setAddress(address);

        for (int i = 0; i < numOrders; i++) {
            order = new OrderImpl();
            order.setName("Order One");
            order.setOrderNumber("1234567890");
            order.setSubmitDate(new Date());
            order.setStatus(OrderStatus.IN_PROCESS);
            order.setSubTotal(new Money(90.00));
            order.setTotalTax(new Money(5.00));
            order.setTotalShipping(new Money(4.99));
            order.setTotal(new Money(99.99));
            order.getFulfillmentGroups().add(fulfillmentGroup);
            order.getPaymentInfos().add(paymentInfo);

            OrderItem item;

            for (int j = 0; j < 2; j++) {
                item = new OrderItemImpl();
                item.setName("Circular Saw");
                item.setPrice(new Money(45.00));
                item.setQuantity(2);
                order.addOrderItem(item);
            }

            orders.add(order);
        }
        return orders;
    }
    
}
