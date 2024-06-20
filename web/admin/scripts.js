

// Function to filter trend data by date range
function filterTrendData(startDate, endDate) {
    const filteredLabels = [];
    const filteredSuccess = [];
    const filteredAll = [];

    for (const date in trendData) {
        if (date >= startDate && date <= endDate) {
            filteredLabels.push(date);
            filteredSuccess.push(trendData[date].success);
            filteredAll.push(trendData[date].all);
        }
    }

    return { labels: filteredLabels, success: filteredSuccess, all: filteredAll };
}

// Update the dashboard with the data
document.getElementById('orders-success').textContent = ordersData.success;
document.getElementById('orders-cancelled').textContent = ordersData.cancelled;
document.getElementById('orders-submitted').textContent = ordersData.submitted;

document.getElementById('revenues-total').textContent = `${revenuesData.total}đ`;

document.getElementById("revenues-category-select").onchange = function() {
    let id = document.getElementById("revenues-category-select").options[document.getElementById("revenues-category-select").selectedIndex].value;
    let value = revenuesData.categories[id] == null ? 0 : revenuesData.categories[id];
    document.getElementById('revenues-categories').textContent = `${value}đ`;
}

document.getElementById('customers-registered').textContent = customersData.registered;
document.getElementById('customers-bought').textContent = customersData.bought;

document.getElementById('feedback-average').textContent = feedbackData.average;
document.getElementById("feedback-category-select").onchange = function() {
    let id = document.getElementById("feedback-category-select").options[document.getElementById("feedback-category-select").selectedIndex].value;
    let value = feedbackData.categories[id] == null ? 0 : feedbackData.categories[id];
    document.getElementById('feedback-categories').textContent = (value);
}

// Initialize the chart
const ctx = document.getElementById('ordersTrendChart').getContext('2d');
let ordersTrendChart = new Chart(ctx, {
    type: 'line',
    data: {
        labels: [],
        datasets: [{
            label: 'Success Orders',
            data: [],
            borderColor: 'rgba(75, 192, 192, 1)',
            borderWidth: 1,
            fill: false
        }, {
            label: 'All Orders',
            data: [],
            borderColor: 'rgba(153, 102, 255, 1)',
            borderWidth: 1,
            fill: false
        }]
    },
    options: {
        responsive: true,
        scales: {
            x: {
                title: {
                    display: true,
                    text: 'Date'
                }
            },
            y: {
                title: {
                    display: true,
                    text: 'Order Count'
                }
            }
        }
    }
});

// Update chart data
function updateChart(startDate, endDate) {
    const filteredData = filterTrendData(startDate, endDate);

    ordersTrendChart.data.labels = filteredData.labels;
    ordersTrendChart.data.datasets[0].data = filteredData.success;
    ordersTrendChart.data.datasets[1].data = filteredData.all;
    ordersTrendChart.update();
}

// Event listener for update button
document.getElementById('update-chart').addEventListener('click', () => {
    const startDate = document.getElementById('start-date').value;
    const endDate = document.getElementById('end-date').value;
    if (startDate && endDate) {
        updateChart(startDate, endDate);
    }
});
document.getElementById('ordersTrendChart').style.display = "";
let last7 = new Date();
last7.setDate(new Date().getDate() - 7);
let today = new Date();
updateChart(last7.getFullYear() + "-"+((last7.getMonth()+1) < 10 ? "0"+(last7.getMonth()+1) : (last7.getMonth()+1))+"-"+((last7.getDate()) < 10 ? "0"+(last7.getDate()) : (last7.getDate())), today.getFullYear() + "-"+((today.getMonth()+1) < 10 ? "0"+(today.getMonth()+1) : (today.getMonth()+1))+"-"+((today.getDate()) < 10 ? "0"+(today.getDate()) : (today.getDate())));