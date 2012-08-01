package com.mycompany.controller.catalog;

import javax.servlet.http.HttpServletRequest;

import org.broadleafcommerce.core.rating.service.type.RatingSortType;
import org.broadleafcommerce.core.rating.service.type.RatingType;
import org.broadleafcommerce.core.web.controller.catalog.BroadleafRatingsController;
import org.broadleafcommerce.core.web.controller.catalog.ReviewForm;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class RatingsController extends BroadleafRatingsController {

	@RequestMapping(value = "/reviews/product/{itemId}", method = RequestMethod.GET)
	public String viewReviewForm(HttpServletRequest request, Model model, @PathVariable("itemId") String itemId, @ModelAttribute("reviewForm") ReviewForm form) {
		return super.viewReviewForm(request, model, form, itemId);
	}
	
	public String readReviews(HttpServletRequest request, Model model, @PathVariable("itemId") String itemId, @RequestParam("start") int start, @RequestParam("finish") int finish) {
		return super.readReviews(request, model, itemId, RatingType.PRODUCT, start, finish, RatingSortType.DEFAULT);
	}
	
	@RequestMapping(value = "/reviews/product/{itemId}", method = RequestMethod.POST)
	public String reviewItem(HttpServletRequest request, @PathVariable("itemId") String itemId, @RequestParam("rating") Double rating, @RequestParam("reviewText") String reviewText) {
		return super.reviewItem(request, itemId, RatingType.PRODUCT, rating, reviewText);
	}
	
	@RequestMapping(value = "/reviews/{reviewId}/vote", method = RequestMethod.POST)
	public String voteReviewAsHelpful(HttpServletRequest request, Model model, @PathVariable("reviewId") Long reviewId, @RequestParam("helpful") String helpful) {
		return super.voteReviewAsHelpful(request, model, reviewId, helpful);
	}
	
}
