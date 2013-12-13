(function ($) {
$.fn.ednDynamicArticleLoader = function (settings) {
	return this.each(function(i, el) {
		var startingArticle = settings.startingArticle,
			$articlesContainer = $(el),
			$triggerWrapper = $(settings.triggerWrapperSelector),
			$returnHtml = $('> .trigger > .actionTextContainer > span', $triggerWrapper),
			$window = $(window),
			$document = $(document),

			requestInProgress = false,
			allArticlesLoaded = false,

			getMoreArticles = function () {
				if (requestInProgress || allArticlesLoaded)
					return false;

				requestInProgress = true;

				$.ajax({
					data: $.extend({}, settings.params, {startingArticle: startingArticle}),
					dataType: 'json',
					success: function (response) {
						$articlesContainer.append(response.content);
						startingArticle = startingArticle + settings.numberOfPostsperPage;

						if (response.itemsRemaining < 1)
							allArticlesLoaded = true;

						if (response.itemsRemaining < 1)
							$triggerWrapper.addClass('hide');

						$returnHtml.html(response.newActionText);
						
					},
					complete: function () {
						requestInProgress = false;

						$triggerWrapper.removeClass('loading');
						$('.rateit').rateit();
					},
					url: settings.sourceUrl
				});

				return true;
			};

		requestInProgress = false;

		$('> .trigger', $triggerWrapper).on('click', function () {
			if (getMoreArticles())
				$triggerWrapper.addClass('loading');

			return false;
		});

		if (settings.triggerOnScroll) {
			$window.scroll(function () {
				var pixelsToBottom = $document.height() - $window.scrollTop() - $window.height();

				if (pixelsToBottom < 500 && getMoreArticles())
					$triggerWrapper.addClass('loading');
			});
		}
	});
};
})(eds1_8);
