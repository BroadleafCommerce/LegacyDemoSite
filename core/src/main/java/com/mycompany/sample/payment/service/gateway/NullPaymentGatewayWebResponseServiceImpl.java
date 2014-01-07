/*
 * #%L
 * BroadleafCommerce Framework Web
 * %%
 * Copyright (C) 2009 - 2013 Broadleaf Commerce
 * %%
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *       http://www.apache.org/licenses/LICENSE-2.0
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 * #L%
 */

package com.mycompany.sample.payment.service.gateway;

import com.mycompany.sample.vendor.nullPaymentGateway.service.payment.NullPaymentGatewayType;
import org.apache.commons.lang.ArrayUtils;
import org.broadleafcommerce.common.money.Money;
import org.broadleafcommerce.common.payment.PaymentTransactionType;
import org.broadleafcommerce.common.payment.PaymentType;
import org.broadleafcommerce.common.payment.dto.PaymentResponseDTO;
import org.broadleafcommerce.common.payment.service.PaymentGatewayWebResponsePrintService;
import org.broadleafcommerce.common.payment.service.PaymentGatewayWebResponseService;
import org.broadleafcommerce.common.vendor.service.exception.PaymentException;
import com.mycompany.sample.vendor.nullPaymentGateway.service.payment.NullPaymentGatewayConstants;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.Map;

/**
 * This is an example implementation of a {@link PaymentGatewayWebResponseService}.
 * This will translate the Post information back from
 * {@link com.mycompany.sample.vendor.nullPaymentGateway.web.controller.NullPaymentGatewayProcessorController}
 * into a PaymentResponseDTO for processing in the Broadleaf System.
 *
 * Replace with a real Payment Gateway Integration like Braintree or PayPal PayFlow.
 *
 * In order to use load this demo service, you will need to component scan
 * the package "com.mycompany.sample".
 *
 * This should NOT be used in production, and is meant solely for demonstration
 * purposes only.
 *
 * @author Elbert Bautista (elbertbautista)
 */
@Service("blNullPaymentGatewayWebResponseService")
public class NullPaymentGatewayWebResponseServiceImpl implements PaymentGatewayWebResponseService {

    @Resource(name = "blPaymentGatewayWebResponsePrintService")
    protected PaymentGatewayWebResponsePrintService webResponsePrintService;

    @Resource(name = "blNullPaymentGatewayConfiguration")
    protected NullPaymentGatewayConfiguration configuration;

    @Override
    public PaymentResponseDTO translateWebResponse(HttpServletRequest request) throws PaymentException {
        PaymentResponseDTO responseDTO = new PaymentResponseDTO(PaymentType.CREDIT_CARD,
                NullPaymentGatewayType.NULL_GATEWAY)
                .rawResponse(webResponsePrintService.printRequest(request));

        Map<String,String[]> paramMap = request.getParameterMap();

        Money amount = Money.ZERO;
        if (paramMap.containsKey(NullPaymentGatewayConstants.TRANSACTION_AMT)) {
            String amt = paramMap.get(NullPaymentGatewayConstants.TRANSACTION_AMT)[0];
            amount = new Money(amt);
        }

        boolean approved = false;
        if (paramMap.containsKey(NullPaymentGatewayConstants.RESULT_SUCCESS)) {
            String[] msg = paramMap.get(NullPaymentGatewayConstants.RESULT_SUCCESS);
            if (ArrayUtils.contains(msg, "true")) {
                approved = true;
            }
        }

        PaymentTransactionType type = PaymentTransactionType.AUTHORIZE_AND_CAPTURE;
        if (!configuration.isPerformAuthorizeAndCapture()) {
            type = PaymentTransactionType.AUTHORIZE;
        }

        responseDTO.successful(approved)
                .amount(amount)
                .paymentTransactionType(type)
                .orderId(paramMap.get(NullPaymentGatewayConstants.ORDER_ID)[0])
                .responseMap(NullPaymentGatewayConstants.GATEWAY_TRANSACTION_ID,
                        paramMap.get(NullPaymentGatewayConstants.GATEWAY_TRANSACTION_ID)[0])
                .responseMap(NullPaymentGatewayConstants.RESULT_MESSAGE,
                        paramMap.get(NullPaymentGatewayConstants.RESULT_MESSAGE)[0])
                .billTo()
                    .addressFirstName(paramMap.get(NullPaymentGatewayConstants.BILLING_FIRST_NAME)[0])
                    .addressLastName(paramMap.get(NullPaymentGatewayConstants.BILLING_LAST_NAME)[0])
                    .addressLine1(paramMap.get(NullPaymentGatewayConstants.BILLING_ADDRESS_LINE1)[0])
                    .addressLine2(paramMap.get(NullPaymentGatewayConstants.BILLING_ADDRESS_LINE2)[0])
                    .addressCityLocality(paramMap.get(NullPaymentGatewayConstants.BILLING_CITY)[0])
                    .addressStateRegion(paramMap.get(NullPaymentGatewayConstants.BILLING_STATE)[0])
                    .addressPostalCode(paramMap.get(NullPaymentGatewayConstants.BILLING_ZIP)[0])
                    .addressCountryCode(paramMap.get(NullPaymentGatewayConstants.BILLING_COUNTRY)[0])
                    .done()
                .creditCard()
                    .creditCardHolderName(paramMap.get(NullPaymentGatewayConstants.CREDIT_CARD_NAME)[0])
                    .creditCardLastFour(paramMap.get(NullPaymentGatewayConstants.CREDIT_CARD_LAST_FOUR)[0])
                    .creditCardType(paramMap.get(NullPaymentGatewayConstants.CREDIT_CARD_TYPE)[0])
                    .creditCardExpDate(paramMap.get(NullPaymentGatewayConstants.CREDIT_CARD_EXP_DATE)[0])
                    .done();

        return responseDTO;

    }


}
