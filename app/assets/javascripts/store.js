Mpl2.Store = DS.Store.extend({
    revision: 11
})

DS.RESTAdapter.map('Mpl2.Account', {
    transactions: { key: 'transaction_ids' }
});

DS.RESTAdapter.map('Mpl2.Category', {
    transactions: { key: 'transaction_ids' }
});
DS.RESTAdapter.map('Mpl2.Category', {
    children: { key: 'children_ids' },
    categories: {key: 'category_ids'}
});

DS.RESTAdapter.map('Mpl2.Aim', {
    transactions: { key: 'transaction_ids' }
});

DS.RESTAdapter.map('Mpl2.PlanItem', {
    transactions: { key: 'transaction_ids' }
});
DS.RESTAdapter.map('Mpl2.Plan', {
    transactions: { key: 'transaction_ids' }
});

DS.RESTAdapter.map('Mpl2.Plan', {
    plan_items: { key: 'plan_item_ids' }
});

DS.RESTAdapter.configure('plurals', { category: 'categories', child: 'children' });