<%@ page import="foodxpress.Repository" %>
<%@ page import="foodxpress.SQLProvider" %>
<%@ page import="foodxpress.Shop" %>
<%@ page import="foodxpress.Vendor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    Vendor vendor = (Vendor) session.getAttribute("vendor");
    SQLProvider provider = new SQLProvider();
    Repository repository = new Repository(provider);
    Shop shop = repository.getShopInfo(vendor.shop_id);
%>
<header class="header">
    <a href="vendor-home">
        <img src="images/logo.png" alt="Logo">
    </a>
    <div class="header-navigation">
        <nav>
            <ul class="navigation-horizontal">
                <li>
                    <a href="vendor-home">
                        <button type="button" class="nav-btn">
                            <i class="fas fa-clipboard-list"></i>
                            <span>ORDER</span>
                        </button>
                    </a>
                </li>
                <li>
                    <a href="view-menu">
                        <button type="button" class="nav-btn">
                            <i class="fas fa-utensils"></i>
                            <span>MENU</span>
                        </button>
                    </a>
                </li>
            </ul>
        </nav>
        <div class="l-row-group-sm l-center">
                <span class="header-username-text">
                    <%=shop.name%>
                </span>
            <nav class="dropdown">
                <a href="shop-profile">
                    <button type="button" class="round-icon-btn">
                        <i class="fas fa-store"></i>
                    </button>
                </a>
                <ul class="navigation-vertical dropdown-content" >
                    <li><a href="shop-profile">Shop Profile</a></li>
                    <li><a href="vendor-change-password">Change Password</a></li>
                    <li><a href="vendor-log-out-servlet">Log Out</a></li>
                </ul>
            </nav>
        </div>
    </div>
</header>