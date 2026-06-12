<template>
    <div class="d-flex flex-column flex-column-fluid">
        <div id="kt_app_toolbar" class="app-toolbar py-3 py-lg-6">
            <div
                id="kt_app_toolbar_container"
                class="app-container container-xxl d-flex flex-stack"
            >
                <div
                    class="page-title d-flex flex-column justify-content-center flex-wrap me-3"
                >
                    <h1
                        class="page-heading d-flex text-dark fw-bold fs-3 flex-column justify-content-center my-0"
                    >
                        Transaction Dashboard
                    </h1>
                    <ul
                        class="breadcrumb breadcrumb-separatorless fw-semibold fs-7 my-0 pt-1"
                    >
                        <li class="breadcrumb-item text-muted">
                            <a href="#" class="text-muted text-hover-primary"
                                >Home</a
                            >
                        </li>
                        <li class="breadcrumb-item">
                            <span class="bullet bg-gray-400 w-5px h-2px"></span>
                        </li>
                        <li class="breadcrumb-item text-muted">
                            Transaction Dashboard
                        </li>
                    </ul>
                </div>

                <div class="d-flex align-items-center gap-2 gap-lg-3">
                    <a
                        href="javascript:void(0)"
                        class="btn btn-sm fw-bold btn-primary"
                        @click="syncData"
                    >
                        <span class="svg-icon svg-icon-3">
                            <svg
                                width="24"
                                height="24"
                                viewBox="0 0 24 24"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                            >
                                <path
                                    opacity="0.3"
                                    d="M20.5 12C20.5 16.6944 16.6944 20.5 12 20.5C7.30558 20.5 3.5 16.6944 3.5 12C3.5 7.30558 7.30558 3.5 12 3.5C16.6944 3.5 20.5 7.30558 20.5 12Z"
                                    fill="currentColor"
                                />
                                <path
                                    d="M12 7C9.23858 7 7 9.23858 7 12C7 12.5523 6.55228 13 6 13C5.44772 13 5 12.5523 5 12C5 8.13401 8.13401 5 12 5C12.5523 5 13 5.44772 13 6C13 6.55228 12.5523 7 12 7Z"
                                    fill="currentColor"
                                />
                                <path
                                    d="M12 17C14.7614 17 17 14.7614 17 12C17 11.4477 17.4477 11 18 11C18.5523 11 19 11.4477 19 12C19 15.866 15.866 19 12 19C11.4477 19 11 18.5523 11 18C11 17.4477 11.4477 17 12 17Z"
                                    fill="currentColor"
                                />
                            </svg>
                        </span>
                        Sync Data
                    </a>
                </div>
            </div>
        </div>

        <div id="kt_app_content" class="app-content flex-column-fluid">
            <div
                id="kt_app_content_container"
                class="app-container container-xxl"
            >
                <!-- Summary Cards -->
                <div class="row g-5 g-xl-8 mb-5 mb-xl-8">
                    <div class="col-sm-6 col-xl-3">
                        <div class="card card-flush h-100">
                            <div class="card-body d-flex align-items-center p-6">
                                <div class="symbol symbol-50px me-5">
                                    <span class="symbol-label bg-light-primary">
                                        <span class="svg-icon svg-icon-2x svg-icon-primary">
                                            <svg
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                            >
                                                <path
                                                    opacity="0.3"
                                                    d="M10.9607 12.9128H18.8607C19.4607 12.9128 19.9607 13.4128 19.8607 14.0128C19.2607 19.0128 14.4607 22.7128 9.26068 21.7128C5.66068 21.0128 2.86071 18.2128 2.16071 14.6128C1.16071 9.31284 4.96069 4.61281 9.86069 4.01281C10.4607 3.91281 10.9607 4.41281 10.9607 5.01281V12.9128Z"
                                                    fill="currentColor"
                                                />
                                                <path
                                                    d="M12.9607 10.9128V3.01281C12.9607 2.41281 13.4607 1.91281 14.0607 2.01281C16.0607 2.21281 17.8607 3.11284 19.2607 4.61284C20.6607 6.01284 21.5607 7.91285 21.8607 9.81285C21.9607 10.4129 21.4607 10.9128 20.8607 10.9128H12.9607Z"
                                                    fill="currentColor"
                                                />
                                            </svg>
                                        </span>
                                    </span>
                                </div>
                                <div class="d-flex flex-column">
                                    <span class="text-gray-500 fw-semibold fs-7"
                                        >Total Transactions</span
                                    >
                                    <span class="text-gray-900 fw-bold fs-2">{{
                                        formatNumber(summary.total)
                                    }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="card card-flush h-100">
                            <div class="card-body d-flex align-items-center p-6">
                                <div class="symbol symbol-50px me-5">
                                    <span class="symbol-label bg-light-success">
                                        <span class="svg-icon svg-icon-2x svg-icon-success">
                                            <svg
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                            >
                                                <rect
                                                    opacity="0.3"
                                                    x="2"
                                                    y="2"
                                                    width="20"
                                                    height="20"
                                                    rx="10"
                                                    fill="currentColor"
                                                />
                                                <path
                                                    d="M10.4343 12.4343L8.75 10.75C8.33579 10.3358 7.66421 10.3358 7.25 10.75C6.83579 11.1642 6.83579 11.8358 7.25 12.25L10.2929 15.2929C10.6834 15.6834 11.3166 15.6834 11.7071 15.2929L17.25 9.75C17.6642 9.33579 17.6642 8.66421 17.25 8.25C16.8358 7.83579 16.1642 7.83579 15.75 8.25L11.5657 12.4343C11.2533 12.7467 10.7467 12.7467 10.4343 12.4343Z"
                                                    fill="currentColor"
                                                />
                                            </svg>
                                        </span>
                                    </span>
                                </div>
                                <div class="d-flex flex-column">
                                    <span class="text-gray-500 fw-semibold fs-7"
                                        >Success</span
                                    >
                                    <span class="text-gray-900 fw-bold fs-2">{{
                                        formatNumber(summary.success)
                                    }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="card card-flush h-100">
                            <div class="card-body d-flex align-items-center p-6">
                                <div class="symbol symbol-50px me-5">
                                    <span class="symbol-label bg-light-danger">
                                        <span class="svg-icon svg-icon-2x svg-icon-danger">
                                            <svg
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                            >
                                                <rect
                                                    opacity="0.3"
                                                    x="2"
                                                    y="2"
                                                    width="20"
                                                    height="20"
                                                    rx="10"
                                                    fill="currentColor"
                                                />
                                                <rect
                                                    x="7"
                                                    y="15.3137"
                                                    width="12"
                                                    height="2"
                                                    rx="1"
                                                    transform="rotate(-45 7 15.3137)"
                                                    fill="currentColor"
                                                />
                                                <rect
                                                    x="8.41422"
                                                    y="7"
                                                    width="12"
                                                    height="2"
                                                    rx="1"
                                                    transform="rotate(45 8.41422 7)"
                                                    fill="currentColor"
                                                />
                                            </svg>
                                        </span>
                                    </span>
                                </div>
                                <div class="d-flex flex-column">
                                    <span class="text-gray-500 fw-semibold fs-7"
                                        >Failed</span
                                    >
                                    <span class="text-gray-900 fw-bold fs-2">{{
                                        formatNumber(summary.failed)
                                    }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-6 col-xl-3">
                        <div class="card card-flush h-100">
                            <div class="card-body d-flex align-items-center p-6">
                                <div class="symbol symbol-50px me-5">
                                    <span class="symbol-label bg-light-info">
                                        <span class="svg-icon svg-icon-2x svg-icon-info">
                                            <svg
                                                width="24"
                                                height="24"
                                                viewBox="0 0 24 24"
                                                fill="none"
                                                xmlns="http://www.w3.org/2000/svg"
                                            >
                                                <path
                                                    opacity="0.3"
                                                    d="M20 15H4C2.9 15 2 14.1 2 13V7C2 6.4 2.4 6 3 6H21C21.6 6 22 6.4 22 7V13C22 14.1 21.1 15 20 15ZM13 12H11C10.5 12 10 12.4 10 13V16C10 16.5 10.4 17 11 17H13C13.6 17 14 16.6 14 16V13C14 12.4 13.6 12 13 12Z"
                                                    fill="currentColor"
                                                />
                                                <path
                                                    d="M14 6V5H10V6H8V5C8 3.9 8.9 3 10 3H14C15.1 3 16 3.9 16 5V6H14ZM20 15H14V16C14 16.6 13.5 17 13 17H11C10.5 17 10 16.6 10 16V15H4C3.6 15 3.3 14.9 3 14.7V18C3 19.1 3.9 20 5 20H19C20.1 20 21 19.1 21 18V14.7C20.7 14.9 20.4 15 20 15Z"
                                                    fill="currentColor"
                                                />
                                            </svg>
                                        </span>
                                    </span>
                                </div>
                                <div class="d-flex flex-column">
                                    <span class="text-gray-500 fw-semibold fs-7"
                                        >Total Amount</span
                                    >
                                    <span class="text-gray-900 fw-bold fs-2">{{
                                        formatAmount(summary.totalAmount, true)
                                    }}</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Chart -->
                <div class="card mb-5 mb-xl-8">
                    <div class="card-header border-0 pt-6">
                        <div class="card-title">
                            <h3 class="fw-bold m-0">Transactions Per Provider</h3>
                        </div>
                    </div>
                    <div class="card-body pt-0">
                        <div ref="chartRef" id="kt_transaction_chart" style="height: 350px"></div>
                    </div>
                </div>

                <!-- Transaction Table -->
                <div class="card">
                    <div class="card-header border-0 pt-6">
                        <div class="card-title">
                            <div
                                class="d-flex align-items-center position-relative my-1"
                            >
                                <span
                                    class="svg-icon svg-icon-1 position-absolute ms-6"
                                >
                                    <svg
                                        width="24"
                                        height="24"
                                        viewBox="0 0 24 24"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg"
                                    >
                                        <rect
                                            opacity="0.5"
                                            x="17.0365"
                                            y="15.1223"
                                            width="8.15546"
                                            height="2"
                                            rx="1"
                                            transform="rotate(45 17.0365 15.1223)"
                                            fill="currentColor"
                                        ></rect>
                                        <path
                                            d="M11 19C6.55556 19 3 15.4444 3 11C3 6.55556 6.55556 3 11 3C15.4444 3 19 6.55556 19 11C19 15.4444 15.4444 19 11 19ZM11 5C7.53333 5 5 7.53333 5 11C5 14.4667 7.53333 17 11 17C14.4667 17 17 14.4667 17 11C17 7.53333 14.4667 5 11 5Z"
                                            fill="currentColor"
                                        ></path>
                                    </svg>
                                </span>
                                <input
                                    type="text"
                                    class="form-control form-control-solid w-250px ps-15"
                                    placeholder="Search Transaction ID"
                                    v-model="search"
                                />
                            </div>
                        </div>
                        <div class="card-toolbar">
                            <div class="d-flex align-items-center gap-2 gap-lg-3">
                                <select
                                    class="form-select form-select-solid form-select-sm"
                                    v-model="filterProvider"
                                >
                                    <option value="">All Providers</option>
                                    <option
                                        v-for="provider in providerList"
                                        :key="provider"
                                        :value="provider"
                                    >
                                        {{ provider }}
                                    </option>
                                </select>
                                <select
                                    class="form-select form-select-solid form-select-sm"
                                    v-model="filterStatus"
                                >
                                    <option value="">All Status</option>
                                    <option
                                        v-for="status in statusList"
                                        :key="status"
                                        :value="status"
                                    >
                                        {{ status }}
                                    </option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="card-body pt-0">
                        <DataTable
                            :columns="columns"
                            :fetchFunction="fetchTransactions"
                            :extraParams="filters"
                            :reloadKey="reloadKey"
                        >
                            <template #row="{ row }">
                                <td>{{ row.trxId ?? row.trx_id }}</td>
                                <td>{{ row.provider }}</td>
                                <td>{{ row.product }}</td>
                                <td>
                                    <span
                                        class="badge"
                                        :class="statusBadgeClass(row.status)"
                                    >
                                        {{ row.status }}
                                    </span>
                                </td>
                                <td>{{ formatAmount(row.amount) }}</td>
                                <td class="text-muted">
                                    {{ formatDateTime(row.createdAt ?? row.created_at) }}
                                </td>
                            </template>
                        </DataTable>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
import { computed, nextTick, onBeforeUnmount, onMounted, ref, watch } from "vue";
import { useMutation, useQuery } from "@tanstack/vue-query";
import DataTable from "@/components/Table.vue";
import customApi from "@/utils/api";
import { swalApiResponse } from "@/utils/swal";
import { showLoading, hideLoading } from "@/utils/loading";

declare const ApexCharts: any;

const providerList = ["TELKOMSEL", "XL", "INDOSAT", "TRI", "SMARTFREN"];
const statusList = ["SUCCESS", "FAILED", "PENDING"];

const search = ref("");
const filterProvider = ref("");
const filterStatus = ref("");
const reloadKey = ref(0);

const columns = [
    { key: "id", label: "No", sortable: true },
    { key: "trxId", label: "Transaction ID", sortable: true },
    { key: "provider", label: "Provider", sortable: true },
    { key: "product", label: "Product", sortable: true },
    { key: "status", label: "Status", sortable: true },
    { key: "amount", label: "Amount", sortable: true },
    { key: "createdAt", label: "Date", sortable: true },
];

const filters = computed(() => ({
    search: search.value,
    provider: filterProvider.value,
    status: filterStatus.value,
}));

// Summary cards & chart data
const { data: summaryData, refetch: refetchSummary } = useQuery({
    queryKey: ["transaction-summary"],
    queryFn: async () => {
        const { data } = await customApi.get("/api-web/transaction/summary");
        return data.data;
    },
});

const summary = computed(() => ({
    total: summaryData.value?.total ?? 0,
    success: summaryData.value?.success ?? 0,
    failed: summaryData.value?.failed ?? 0,
    totalAmount: Number(
        summaryData.value?.totalAmount ?? summaryData.value?.total_amount ?? 0,
    ),
}));

const perProvider = computed(
    () => summaryData.value?.perProvider ?? summaryData.value?.per_provider ?? [],
);

// Transaction table
const fetchTransactions = async (params: any) => {
    const { sortBy, sortOrder, ...restParams } = params;
    const { data } = await customApi.get("/api-web/transaction", {
        params: {
            ...restParams,
            sortBy,
            sortOrder,
            sort_by: sortBy,
            sort_order: sortOrder,
        },
    });
    return data.data;
};

const statusBadgeClass = (status: string) => {
    switch (status) {
        case "SUCCESS":
            return "badge-light-success";
        case "FAILED":
            return "badge-light-danger";
        case "PENDING":
            return "badge-light-warning";
        default:
            return "badge-light-secondary";
    }
};

const formatNumber = (value: number) => value.toLocaleString("en-US");

const formatAmount = (value: number | string, short = false) => {
    const numericValue = Number(value);
    if (short) {
        return `Rp ${(numericValue / 1000000).toFixed(1)}M`;
    }
    return `Rp ${numericValue.toLocaleString("en-US")}`;
};

const formatDateTime = (value: string) => {
    if (!value) return "-";

    const date = new Date(value);
    if (Number.isNaN(date.getTime())) return value;

    const year = date.getFullYear();
    const month = String(date.getMonth() + 1).padStart(2, "0");
    const day = String(date.getDate()).padStart(2, "0");
    const hours = String(date.getHours()).padStart(2, "0");
    const minutes = String(date.getMinutes()).padStart(2, "0");

    return `${year}-${month}-${day} ${hours}:${minutes}`;
};

const syncMutation = useMutation({
    mutationFn: async () => {
        const { data } = await customApi.post("/api-web/transaction/sync");
        return data;
    },
    onMutate: () => {
        showLoading();
    },
    onSuccess: (res) => {
        swalApiResponse(res, {
            successMessage: "Sinkronisasi data berhasil",
        });
        refetchSummary();
        reloadKey.value++;
    },
    onError: (err) => {
        swalApiResponse(err, {
            errorMessage: "Gagal sinkronisasi data.",
        });
    },
    onSettled: () => {
        hideLoading();
    },
});

const syncData = () => {
    syncMutation.mutate();
};

const chartRef = ref<HTMLElement | null>(null);
let chart: any = null;

const resizeChart = () => {
    chart?.resize();
};

onMounted(async () => {
    if (!chartRef.value) return;

    await nextTick();

    chart = new ApexCharts(chartRef.value, {
        chart: {
            type: "bar",
            width: "100%",
            height: 350,
            toolbar: { show: false },
        },
        plotOptions: {
            bar: {
                borderRadius: 4,
                columnWidth: "30%",
            },
        },
        dataLabels: { enabled: false },
        series: [
            {
                name: "Transactions",
                data: perProvider.value.map((d: any) => Number(d.total)),
            },
        ],
        xaxis: {
            categories: perProvider.value.map((d: any) => d.provider),
            labels: {
                style: { colors: "#A1A5B7", fontSize: "11px", fontWeight: 600 },
            },
            axisBorder: { show: false },
            axisTicks: { show: false },
        },
        yaxis: {
            labels: {
                style: { colors: "#A1A5B7", fontSize: "11px" },
            },
        },
        grid: {
            borderColor: "#E4E6EF",
            strokeDashArray: 4,
            yaxis: { lines: { show: true } },
        },
        colors: ["#3E97FF"],
        fill: { opacity: 1 },
    });

    chart.render();

    window.addEventListener("resize", resizeChart);
});

watch(perProvider, (value) => {
    if (!chart) return;

    chart.updateOptions({
        xaxis: {
            categories: value.map((d: any) => d.provider),
        },
    });
    chart.updateSeries([
        {
            name: "Transactions",
            data: value.map((d: any) => Number(d.total)),
        },
    ]);
});

onBeforeUnmount(() => {
    window.removeEventListener("resize", resizeChart);
    chart?.destroy();
});
</script>
