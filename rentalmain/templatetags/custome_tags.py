from django import template
import math

from accounts.models import FeedbackRating

register = template.Library()

@register.filter
def times(number, minus=0):
    return range(number-minus)
@register.filter
def times(number, minus=0):
    return range(number-minus)

def getAvgRating(reviews):
    rating = 0
    if reviews:
        for review in reviews:
            rating += review.rating
        return math.floor(rating/len(reviews))
    else:
        return rating

register.filter('getAvgRating',getAvgRating)