require "spec_helper"

describe AdditionalCostsController do
  describe "routing" do
    describe "routes to #index," do
      context "when using url," do
        subject{ { get: "/projects/1/additional_costs" } }
        it{ should be_routable }
        it{ should route_to(controller: "additional_costs", action: "index", project_id: "1") }
      end
      context "when using prefix_path," do
        subject{ { get: project_additional_costs_path(project_id: 1) } }
        it{ should be_routable }
        it{ should route_to(controller: "additional_costs", action: "index", project_id: "1") }
      end
    end

    describe "routes to #new," do
      context "when using url," do
        subject{ { get: "/projects/1/additional_costs/new" } }
        it{ should be_routable }
        it{ should route_to(controller: "additional_costs", action: "new", project_id: "1") }
      end
      context "when using prefix_path," do
        subject{ { get: new_project_additional_cost_path(project_id: 1) } }
        it{ should be_routable }
        it{ should route_to(controller: "additional_costs", action: "new", project_id: "1") }
      end
    end

    describe "routes to #show," do
      context "when using url," do
        subject{ { get: "/projects/1/additional_costs/2" } }
        it{ should be_routable }
        it{ should route_to(controller: "additional_costs", action: "show", project_id: "1", id: "2") }
      end
      context "when using prefix_path," do
        subject{ { get: project_additional_cost_path(project_id: 1, id: 2) } }
        it{ should be_routable }
        it{ should route_to(controller: "additional_costs", action: "show", project_id: "1", id: "2") }
      end
    end

    describe "routes to #edit," do
      context "when using url," do
        subject{ { get: "/projects/1/additional_costs/2/edit" } }
        it{ should be_routable }
        it{ should route_to(controller: "additional_costs", action: "edit", project_id: "1", id: "2") }
      end
      context "when using prefix_path," do
        subject{ { get: edit_project_additional_cost_path(project_id: 1, id: 2) } }
        it{ should be_routable }
        it{ should route_to(controller: "additional_costs", action: "edit", project_id: "1", id: "2") }
      end
    end

    describe "routes to #create," do
      subject{ { post: "/projects/1/additional_costs" } }
      it{ should be_routable }
      it{ should route_to(controller: "additional_costs", action: "create", project_id: "1") }
    end

    describe "routes to #update," do
      subject{ { put: "/projects/1/additional_costs/2" } }
      it{ should be_routable }
      it{ should route_to(controller: "additional_costs", action: "update", project_id: "1", id: "2") }
    end

    describe "routes to #destroy" do
      subject{ { delete: "/projects/1/additional_costs/2" } }
      it{ should be_routable }
      it{ should route_to(controller: "additional_costs", action: "destroy", project_id: "1", id: "2") }
    end
  end
end
