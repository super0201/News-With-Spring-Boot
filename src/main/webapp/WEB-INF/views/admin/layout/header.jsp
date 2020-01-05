<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="app-header header-shadow bg-asteroid sidebar text-light">
	<div class="app-header__logo">
		<!-- logo -->
		<div class="logo-src"></div>
		<div class="header__pane ml-auto">
			<div>
				<button type="button"
					class="hamburger close-sidebar-btn hamburger--elastic"
					data-class="closed-sidebar">
					<span class="hamburger-box"> <span class="hamburger-inner"></span>
					</span>
				</button>
			</div>
		</div>
	</div>
	<div class="app-header__mobile-menu">
		<div>
			<button type="button"
				class="hamburger hamburger--elastic mobile-toggle-nav">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</button>
		</div>
	</div>
	<div class="app-header__menu">
		<span>
			<button type="button"
				class="btn-icon btn-icon-only btn btn-primary btn-sm mobile-toggle-header-nav">
				<span class="btn-icon-wrapper"> <i
					class="fa fa-ellipsis-v fa-w-6"></i>
				</span>
			</button>
		</span>
	</div>
	<div class="app-header__content">
		<div class="app-header-left">
			<div class="search-wrapper">
				<div class="input-holder">
					<input type="text" class="search-input"
						placeholder="Type to search">
					<button class="search-icon">
						<span></span>
					</button>
				</div>
				<button class="close"></button>
			</div>
		</div>
		<div class="app-header-right">
			<div class="header-btn-lg pr-0">
				<div class="widget-content p-0">
					<div class="widget-content-wrapper">
						<div class="widget-content-left">
							<div class="btn-group">
								<a data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false" class="p-0 btn"> <img style="width: 40px; height: 40px" width="35"
									class="rounded-circle" src="/static/images/news/${user.images}"
									alt=""> <i class="fa fa-angle-down ml-2 opacity-8"></i>
								</a>
								<div tabindex="-1" role="menu" aria-hidden="true"
									class="dropdown-menu dropdown-menu-right">
									<button type="button" tabindex="0" class="dropdown-item">Tài
										khoản</button>
									<button type="button" tabindex="0" class="dropdown-item">Cài
										đặt</button>
									<button type="button" tabindex="0" class="dropdown-item">Chức
										năng</button>
									<div tabindex="-1" class="dropdown-divider"></div>
									<button type="submit" tabindex="0" class="dropdown-item"> <a href="/logout">Đăng xuất</a></button>
								</div>
							</div>
						</div>
						<div class="widget-content-left  ml-3 header-user-info">
							<div class="widget-heading" hidden="">${userName}</div>
							<div class="widget-heading">${fullname}</div>
							<div class="widget-subheading">${user.role.roleName}</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>