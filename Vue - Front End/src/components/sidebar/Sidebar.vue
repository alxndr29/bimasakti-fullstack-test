<template>
    <div class="app-wrapper flex-column flex-row-fluid" id="kt_app_wrapper">
        <div
            id="kt_app_sidebar"
            class="app-sidebar flex-column"
            data-kt-drawer="true"
            data-kt-drawer-name="app-sidebar"
            data-kt-drawer-activate="{default: true, lg: false}"
            data-kt-drawer-overlay="true"
            data-kt-drawer-width="225px"
            data-kt-drawer-direction="start"
            data-kt-drawer-toggle="#kt_app_sidebar_mobile_toggle"
        >
            <div class="app-sidebar-logo px-6" id="kt_app_sidebar_logo">
                <a href="#">
                    <img
                        alt="Logo"
                        src="/assets/media/logos/default.svg"
                        class="h-25px app-sidebar-logo-default theme-light-show"
                    />
                    <img
                        alt="Logo"
                        src="/assets/media/logos/default-dark.svg"
                        class="h-25px app-sidebar-logo-default theme-dark-show"
                    />
                    <img
                        alt="Logo"
                        src="/assets/media/logos/default-small.svg"
                        class="h-20px app-sidebar-logo-minimize"
                    />
                </a>
                <div
                    id="kt_app_sidebar_toggle"
                    class="app-sidebar-toggle btn btn-icon btn-shadow btn-sm btn-color-muted btn-active-color-primary body-bg h-30px w-30px position-absolute top-50 start-100 translate-middle rotate"
                    data-kt-toggle="true"
                    data-kt-toggle-state="active"
                    data-kt-toggle-target="body"
                    data-kt-toggle-name="app-sidebar-minimize"
                >
                    <span class="svg-icon svg-icon-2 rotate-180">
                        <svg
                            width="24"
                            height="24"
                            viewBox="0 0 24 24"
                            fill="none"
                            xmlns="http://www.w3.org/2000/svg"
                        >
                            <path
                                opacity="0.5"
                                d="M14.2657 11.4343L18.45 7.25C18.8642 6.83579 18.8642 6.16421 18.45 5.75C18.0358 5.33579 17.3642 5.33579 16.95 5.75L11.4071 11.2929C11.0166 11.6834 11.0166 12.3166 11.4071 12.7071L16.95 18.25C17.3642 18.6642 18.0358 18.6642 18.45 18.25C18.8642 17.8358 18.8642 17.1642 18.45 16.75L14.2657 12.5657C13.9533 12.2533 13.9533 11.7467 14.2657 11.4343Z"
                                fill="currentColor"
                            ></path>
                            <path
                                d="M8.2657 11.4343L12.45 7.25C12.8642 6.83579 12.8642 6.16421 12.45 5.75C12.0358 5.33579 11.3642 5.33579 10.95 5.75L5.40712 11.2929C5.01659 11.6834 5.01659 12.3166 5.40712 12.7071L10.95 18.25C11.3642 18.6642 12.0358 18.6642 12.45 18.25C12.8642 17.8358 12.8642 17.1642 12.45 16.75L8.2657 12.5657C7.95328 12.2533 7.95328 11.7467 8.2657 11.4343Z"
                                fill="currentColor"
                            ></path>
                        </svg>
                    </span>
                </div>
            </div>
            <div class="app-sidebar-menu overflow-hidden flex-column-fluid">
                <div
                    id="kt_app_sidebar_menu_wrapper"
                    class="app-sidebar-wrapper hover-scroll-overlay-y my-5"
                    data-kt-scroll="true"
                    data-kt-scroll-activate="true"
                    data-kt-scroll-height="auto"
                    data-kt-scroll-dependencies="#kt_app_sidebar_logo, #kt_app_sidebar_footer"
                    data-kt-scroll-wrappers="#kt_app_sidebar_menu"
                    data-kt-scroll-offset="5px"
                    data-kt-scroll-save-state="true"
                    style="height: 620px"
                >
                    <div
                        class="menu menu-column menu-rounded menu-sub-indention px-3"
                        id="#kt_app_sidebar_menu"
                        data-kt-menu="true"
                        data-kt-menu-expand="false"
                    >
                        <div class="menu-item pt-5">
                            <div class="menu-content">
                                <span
                                    class="menu-heading fw-bold text-uppercase fs-7"
                                    >Transaction</span
                                >
                            </div>
                        </div>
                        <div class="menu-item">
                            <router-link
                                to="/transaction/dashboard"
                                class="menu-link"
                                active-class="active"
                            >
                                <span class="menu-icon">
                                    <span class="svg-icon svg-icon-2">
                                        <svg
                                            width="24"
                                            height="24"
                                            viewBox="0 0 24 24"
                                            fill="none"
                                            xmlns="http://www.w3.org/2000/svg"
                                        >
                                            <path
                                                opacity="0.3"
                                                d="M19 22H5C4.4 22 4 21.6 4 21V3C4 2.4 4.4 2 5 2H14L20 8V21C20 21.6 19.6 22 19 22Z"
                                                fill="currentColor"
                                            ></path>
                                            <path
                                                d="M9 13H7V17H9V13ZM13 10H11V17H13V10ZM17 7H15V17H17V7Z"
                                                fill="currentColor"
                                            ></path>
                                        </svg>
                                    </span>
                                </span>
                                <span class="menu-title">Dashboard</span>
                            </router-link>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="app-main flex-column flex-row-fluid" id="kt_app_main">
            <router-view />
        </div>
        <div id="kt_app_footer" class="app-footer">
            <div
                class="app-container container-fluid d-flex flex-column flex-md-row flex-center flex-md-stack py-3"
            >
                <div class="text-dark order-2 order-md-1">
                    <span class="text-muted fw-semibold me-1">2022&copy;</span>
                    <a
                        href="#"
                        target="_blank"
                        class="text-gray-800 text-hover-primary"
                        >Keenthemes</a
                    >
                </div>
                <ul
                    class="menu menu-gray-600 menu-hover-primary fw-semibold order-1"
                >
                    <li class="menu-item">
                        <a href="#" target="_blank" class="menu-link px-2"
                            >About</a
                        >
                    </li>
                    <li class="menu-item">
                        <a href="#" target="_blank" class="menu-link px-2"
                            >Support</a
                        >
                    </li>
                    <li class="menu-item">
                        <a href="#" target="_blank" class="menu-link px-2"
                            >Purchase</a
                        >
                    </li>
                </ul>
            </div>
        </div>
    </div>
</template>
