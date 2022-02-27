from django.shortcuts import redirect,HttpResponse,render

def isAuthenticated(view_fun):
    def wrapper(request,*args,**kwargs):
        if request.user.is_authenticated:
            return redirect('/')
        else:
            return view_fun(request,*args,**kwargs)
    return wrapper

def allowed_users(allowed_roles=[]):
    def decorator(view_func):
        def wrapper(request,*args,**kwargs):

            group=None
            if request.user.groups.exists():
                group=request.user.groups.all()[0].name

            if group in allowed_roles:
                return view_func(request,*args,**kwargs)

            else:
                return HttpResponse("you are not authorized ")       
        return wrapper
    return decorator

def notAllowed_users(roles=[]):
    def decorator(view_func):
        def wrapper(request,*args,**kwargs):

            group=None
            if request.user.groups.exists():
                group=request.user.groups.all()[0].name
                print(group)

            if group not in roles:
                return view_func(request,*args,**kwargs)
            
            elif group == 'deliveryboy':
                return HttpResponse("you are delivery boy")

        return wrapper
    return decorator


def admin_only(view_func):
    def wrapper_func(request,*args, **kwargs):
        if request.user.is_superuser:
            return view_func(request,*args, **kwargs)
        else:
            return redirect('home')
    return wrapper_func